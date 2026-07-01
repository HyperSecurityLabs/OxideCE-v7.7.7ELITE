#!/usr/bin/env python3
"""Build encrypted SQLite database from OXIDE CSV test files.
Uses AES-256-GCM (matches src/db.rs).

Usage:
    python3 tools/build_db.py                          # normal build
    python3 tools/build_db.py --key "custom-key-here"  # custom master secret
    python3 tools/build_db.py --plain                  # skip encryption (plain db)
"""

import csv
import sqlite3
import os
import sys
import json
import hashlib
from cryptography.hazmat.primitives.ciphers.aead import AESGCM

DB_DIR = os.path.join(os.path.dirname(os.path.dirname(__file__)), "cgi_database")
CSV_SOURCE = os.path.join(os.path.dirname(DB_DIR), "csv_source")
OUTPUT = os.path.join(DB_DIR, "oxide_tests.db")

CSV_FILES = [
    "db_tests_small.csv",
    "db_api_microservices.csv",
    "db_cloud_kubernetes.csv",
    "db_cloud_providers.csv",
    "db_devops_cicd.csv",
    "db_infra_databases.csv",
    "db_messaging_queues.csv",
    "db_infra_monitoring.csv",
    "db_modern_web_spa.csv",
    "db_ai_ml.csv",
    "db_supply_chain.csv",
    "db_web3_blockchain.csv",
    "db_serverless_functions.csv",
    "db_legacy_admin.csv",
    "db_network_infra.csv",
    "db_backup_logs.csv",
    "db_config_secrets.csv",
    "db_mobile_backend.csv",
    "db_additional.csv",
    "db_dos_stealth.csv",
    "db_breach_data.csv",
    "db_tests_medium.csv",
    "db_tests_large.csv",
]

# Master secret — matches the Rust side (SHA-256 derived for AES-256-GCM)
DEFAULT_KEY = b"OXIDE::v8.6.9community-edition::HyperSecurityOffensiveLabs"


def build_database(key: bytes, encrypt: bool):
    if os.path.exists(OUTPUT):
        os.remove(OUTPUT)

    conn = sqlite3.connect(OUTPUT)
    conn.execute("PRAGMA journal_mode=WAL;")
    conn.execute("PRAGMA synchronous=OFF;")

    conn.execute("""
        CREATE TABLE IF NOT EXISTS tests (
            id          INTEGER PRIMARY KEY AUTOINCREMENT,
            path        TEXT NOT NULL,
            method      TEXT NOT NULL DEFAULT 'GET',
            expected_status TEXT NOT NULL DEFAULT '200',
            content_indicators TEXT DEFAULT '',
            severity    TEXT NOT NULL DEFAULT 'Info',
            category    TEXT NOT NULL DEFAULT 'General',
            title       TEXT DEFAULT '',
            description TEXT DEFAULT '',
            remediation TEXT DEFAULT '',
            download_flag INTEGER NOT NULL DEFAULT 0
        );
    """)

    total = 0
    for fname in CSV_FILES:
        fpath = os.path.join(CSV_SOURCE, fname)
        if not os.path.exists(fpath):
            print(f"  [!] Skipping (not found): {fname}")
            continue

        with open(fpath, "r", encoding="utf-8", errors="replace") as f:
            # Skip comment lines (starting with #) — the CSVs have header comments
            lines = [l for l in f if not l.startswith("#")]
        reader = csv.DictReader(lines)
        count = 0
        for row in reader:
            conn.execute("""
                INSERT INTO tests (path, method, expected_status, content_indicators,
                                   severity, category, title, description, remediation, download_flag)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (
                row.get("path", "").strip(),
                row.get("method", "GET").strip(),
                row.get("expected_status", "200").strip(),
                row.get("content_indicators", "").strip(),
                row.get("severity", "Info").strip(),
                row.get("category", "General").strip(),
                row.get("title", "").strip(),
                row.get("description", "").strip(),
                row.get("remediation", "").strip(),
                1 if row.get("download_flag", "").strip().lower() == "true" else 0,
            ))
            count += 1
        total += count
        print(f"  [OK] {fname}: {count} records")

    conn.commit()
    conn.execute("CREATE INDEX IF NOT EXISTS idx_tests_severity ON tests(severity);")
    conn.execute("CREATE INDEX IF NOT EXISTS idx_tests_category ON tests(category);")
    conn.execute("ANALYZE;")
    conn.close()

    print(f"\n  Total records: {total}")
    print(f"  DB file: {OUTPUT} ({os.path.getsize(OUTPUT)} bytes)")

    if encrypt:
        encrypt_db(OUTPUT, key)
        enc_path = OUTPUT + ".enc"
        print(f"  Encrypted: {enc_path} ({os.path.getsize(enc_path)} bytes)")
        os.remove(OUTPUT)


def encrypt_db(path: str, key: bytes):
    """AES-256-GCM encrypt the SQLite DB file.
    Format: [12-byte nonce][ciphertext + 16-byte GCM tag]
    Matches src/db.rs decryption.
    """
    # Derive 256-bit AES key via SHA-256 (matches Rust derive_key())
    aes_key = hashlib.sha256(key).digest()

    with open(path, "rb") as f:
        data = f.read()

    aesgcm = AESGCM(aes_key)
    nonce = os.urandom(12)
    ciphertext = aesgcm.encrypt(nonce, data, None)

    with open(path + ".enc", "wb") as f:
        f.write(nonce + ciphertext)


if __name__ == "__main__":
    key = DEFAULT_KEY
    encrypt = True

    for arg in sys.argv[1:]:
        if arg.startswith("--key="):
            key = arg.split("=", 1)[1].encode()
        elif arg == "--plain":
            encrypt = False
        elif arg == "--help":
            print(__doc__)
            sys.exit(0)

    print("[*] Building OXIDE test database from CSVs ...")
    build_database(key, encrypt)
    print("[+] Done.")
