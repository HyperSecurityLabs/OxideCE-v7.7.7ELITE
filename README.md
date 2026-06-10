#OxideCE-v7.7.7ELITE
<p align="center">
  <a href="https://www.kali.org/">
    <img src="https://www.kali.org/images/kali-logo.svg" alt="Kali Linux" width="300"/>
  </a>
  <br><br>
  <img src="../logo-cp77-yellow-en@2x-a95c56ad.png" alt="OXIDE CE" width="380"/>
</p>

<h1 align="center" style="color: #557C93; font-family: 'Courier New', monospace;">
  OXIDE — Community Edition <span style="color:#b388ff;">v7.7.7-elite</span>
</h1>

<p align="center">
  <span style="color:#557C93; font-size: 1.1em;">Open eXtensible Intelligence & Detection Engine</span>
  <br>
  <span style="color:#00d4ff;">AI-Powered Security Toolkit</span>
  <span style="color:#557C93;"> · </span>
  <span style="color:#b388ff;">Red Team Operations</span>
  <span style="color:#557C93;"> · </span>
  <span style="color:#00e676;">Kali Linux Ready</span>
</p>

<br>

<p align="center">
  <a href="https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE">
    <img src="https://img.shields.io/badge/⛁%20GitHub-OxideCE--v7.7.7ELITE-557C93?style=for-the-badge&logo=github" alt="GitHub">
  </a>
  <a href="https://hypersecurityoffensivelabs-about.is-best.net/">
    <img src="https://img.shields.io/badge/⎈%20Website-HyperSecurity%20Labs-00d4ff?style=for-the-badge&logo=google-chrome" alt="Website">
  </a>
  <a href="https://t.me/hypersecurity_offsec">
    <img src="https://img.shields.io/badge/✉%20Telegram-@hypersecurity__offsec-b388ff?style=for-the-badge&logo=telegram" alt="Telegram">
  </a>
  <br>
  <a href="https://www.kali.org/">
    <img src="https://img.shields.io/badge/⎈%20Kali%20Linux-Ready-367bf0?style=for-the-badge&logo=kalilinux" alt="Kali Linux">
  </a>
  <a href="https://www.rust-lang.org/">
    <img src="https://img.shields.io/badge/⚙%20Rust-2021%20Edition-00e676?style=for-the-badge&logo=rust" alt="Rust">
  </a>
  <a href="https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE/issues">
    <img src="https://img.shields.io/badge/⚠%20Issues-Report%20Bugs-ff6b6b?style=for-the-badge&logo=bugatti" alt="Issues">
  </a>
  <br>
  <a href="https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE/discussions">
    <img src="https://img.shields.io/badge/💬%20Discussions-Community%20Chat-557C93?style=for-the-badge&logo=github" alt="Discussions">
  </a>
  <a href="https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE/releases">
    <img src="https://img.shields.io/badge/📦%20Releases-Download-00e676?style=for-the-badge&logo=github" alt="Releases">
  </a>
</p>

<br>

<p align="center">
  <b style="color:#00d4ff; font-size: 1.2em;">⭐ Support OXIDE for Kali Linux Official Repository</b>
  <br>
  <span style="color:#557C93;">
    If you find this tool useful in your security operations, please
    <a href="https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE" style="color:#b388ff; font-weight: bold;">star the repository on GitHub</a>.
    Your support helps us get OXIDE included in the official Kali Linux tools repository,
    making it accessible to the entire Kali community with a simple
    <code style="color:#00e676;">apt install oxide</code>.
  </span>
</p>

---

## 🐉 About OXIDE

[![GitHub](https://img.shields.io/badge/GitHub-OxideCE--v7.7.7ELITE-557C93?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![Website](https://img.shields.io/badge/Website-HyperSecurity-00d4ff?logo=google-chrome)](https://hypersecurityoffensivelabs-about.is-best.net/)
[![Telegram](https://img.shields.io/badge/Telegram-@hypersecurity__offsec-b388ff?logo=telegram)](https://t.me/hypersecurity_offsec)

Modular security toolkit integrating traditional vulnerability scanning with ML-based anomaly detection. Built in Rust for Kali Linux inclusion.

### Core Stack

- **Language:** Rust 2021 Edition — memory safe, zero-cost abstractions
- **Runtime:** `tokio` async — non-blocking I/O, concurrent scanning
- **ML:** `smartcore` (Random Forest, SVM), `linfa` (clustering), `ndarray`, `statrs`
- **Output:** HTML (cyberpunk theme) + JSON reports, auto-saved every run

---

## 🛡️ Kali Linux Ready

[![Kali Linux](https://img.shields.io/badge/Kali%20Linux-Ready-367bf0?logo=kalilinux)](https://www.kali.org/)
[![Rust](https://img.shields.io/badge/Rust-2021-00e676?logo=rust)](https://www.rust-lang.org/)
[![GitHub](https://img.shields.io/badge/GitHub-OxideCE--v7.7.7ELITE-557C93?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)

```text
├── Active Recon (pnet raw sockets)  ── src/recon.rs         #[cfg(target_os = "linux")]
├── Kali colour palette               ── src/cli/display.rs   ELITE_KALI (85,124,148)
├── DEB packaging                     ── oxide-ce-debian/
├── Arch packaging                    ── PKGBUILD
└── Targeting: apt install oxide      ── Kali official repo inclusion
```

Complements: `sqlmap` (ML-enhanced SQLi), `nmap` (app-layer focus), `burpsuite` (CLI-native), `metasploit` (post-scan validation).

---

## 📦 Installation

[![Kali Linux](https://img.shields.io/badge/Install-Kali%20Linux-367bf0?logo=kalilinux)](https://www.kali.org/)
[![Rust](https://img.shields.io/badge/Build-Rust-00e676?logo=rust)](https://www.rust-lang.org/)
[![GitHub](https://img.shields.io/badge/Clone-GitHub-557C93?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)

```bash
sudo apt update && sudo apt install -y build-essential pkg-config libssl-dev cmake
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

git clone https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE.git
cd OxideCE-v7.7.7ELITE && cargo build --release
sudo cp target/release/oxide /usr/local/bin/

oxide --version        # → oxide 7.7.7-elite
oxide --help
oxide --list-modules
```

---

## 🚀 Quick Start

[![Examples](https://img.shields.io/badge/Examples-Usage-00d4ff?logo=terminal)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![Modules](https://img.shields.io/badge/Modules-Reference-b388ff?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)

```bash
# Full scan
oxide --url https://example.com --modules all --duration 120

# Specific modules
oxide --url https://example.com --modules sqli,xss,lfi,cmd-injection

# Zero-day ML scan
oxide --url https://example.com --zeroday --duration 120

# Multi-target concurrent
oxide --multiattack --url https://target1.com --url https://target2.com

# Authenticated scan
oxide --url https://example.com/admin --cookie "session=abc123"

# Headless Chrome JS rendering
oxide --url https://example.com --headless --crawl-depth 5

# Passive recon
oxide --url https://example.com --modules recon-only

# Proxy through Burp
oxide --url https://example.com --proxy http://127.0.0.1:8080 --delay 200
```

---

## 🔬 Scanner Modules (13)

[![SQLi](https://img.shields.io/badge/SQLi-Error/Boolean/Time/Union-ff6b6b?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![XSS](https://img.shields.io/badge/XSS-Reflected/Stored/DOM-00d4ff?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![LFI](https://img.shields.io/badge/LFI-File%20Read-557C93?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)

| Module | File | Detection |
|--------|------|-----------|
| **SQLi** | `sqli_scanner.rs` | Error-based, boolean blind, time-based, UNION, stacked queries |
| **Blind SQLi** | `blind_sqli_scanner.rs` | Blind/time-based SQL injection detection |
| **XSS** | `xss_scanner.rs` | Reflected, stored, DOM-based cross-site scripting |
| **LFI** | `lfi_scanner.rs` | Local File Inclusion with file-read confirmation |
| **Path Traversal** | `path_traversal_scanner.rs` | Directory traversal vulnerability detection |
| **CMD Injection** | `cmd_injection_scanner.rs` | OS command injection (Linux + Windows) |
| **CORS** | `cors_scanner.rs` | CORS misconfiguration scanning |
| **TLS** | `tls_scanner.rs` | SSL/TLS config: certs, protocols, ciphers, vulnerabilities |
| **Common App** | `common_app_scanner.rs` | Nikto-style common paths, files, admin panels |
| **Default Creds** | `default_creds_scanner.rs` | Default credentials for known admin panels |
| **DB Fingerprint** | `db_fingerprinter.rs` | MySQL, PostgreSQL, MSSQL, Oracle, SQLite detection |
| **Cloudflare** | `hypersecurity_cf.rs` | WAF detection + bypass strategies |
| **Content Filter** | `filter.rs` | Regex sensitive data detection (keys, tokens, passwords) |

---

## 🧠 Zero-Day ML Engine

[![ML](https://img.shields.io/badge/ML-Random%20Forest%20%7C%20SVM-00e676?logo=smart)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![Source](https://img.shields.io/badge/Source-zero__day%2F-557C93?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE/tree/main/src/zero_day)

```text
Phase 1 ── Crawl (30s max) → Phase 2 ── ML Analysis + Auto-Exploit
Phase 2.5 ── Fuzz Test (15 payload types) → Phase 3 ── Report
```

| Component | Library | File |
|-----------|---------|------|
| Feature Extraction | Custom | `features.rs` |
| Random Forest | `smartcore` | `classifier.rs` |
| SVM | `smartcore` | `classifier.rs` |
| Baseline Profiling | Statistical | `baseline.rs` |
| Anomaly Scoring | Multi-signal | `anomaly.rs` |
| Trainer | `--train` | `trainer.rs` |

Auto-exploit: SQLi (`' OR '1'='1`), XSS (`<img src=x onerror=alert(1)>`), LFI (`../../../../etc/passwd`), CMDi (`; id`), SSTI (`{{7*7}}`).

---

## 🔧 Advanced Features

[![WAF](https://img.shields.io/badge/WAF%20Bypass-12%20Strategies-ff6b6b?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![Session](https://img.shields.io/badge/Session-Cookie/Basic/OAuth2-b388ff?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![Headless](https://img.shields.io/badge/Headless-Chrome%20JS-00d4ff?logo=google-chrome)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)

### WAF Detection & Bypass
- **12 WAF vendors** detected: Cloudflare, AWS WAF, ModSecurity, F5 BIG-IP, Imperva, Akamai, Sucuri, Radware, Palo Alto, Fortinet, Barracuda, Citrix
- **12 evasion techniques**: protocol level, encoding, case randomization, comments, whitespace, path unicode, time delay, fragmentation, header injection, JSON/XML/Multipart
- **Cloudflare bypass engine**: case mutation, comment injection, URL encoding, header spoofing, origin IP discovery via 10 spoofed headers
- **Multi-UA probing**: 5 user agents for WAF evasion

### Session & Auth
- **Auth types**: Cookie, Bearer Token, Basic Auth, API Key, JWT, OAuth2
- **Session hijack testing**: HttpOnly/Secure/SameSite flags, fixation, predictability
- **Custom headers**: repeatable `--header` flag + persistent config

### JS Rendering & Crawling
- **`--headless`**: Chromium browser for JS-rendered content
- **SPA support**: React Router, Vue Router, Angular route extraction
- **JS URL discovery**: fetch(), axios, $.ajax, XHR, WebSocket endpoints

### API Fuzzing
- **Methods**: GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD
- **Content types**: JSON, form, multipart, XML, GraphQL
- **Auth testing**: None, Bearer, Basic, API Key

### WebSocket Testing
- **Payloads**: SQLi, XSS, CMDi, path traversal, JSON injection, format string, DoS

### Cluster / Distributed
- **Master/worker architecture**: TCP-based cluster communication
- **Messages**: heartbeat, task assign/complete/fail, status, shutdown

---

## ⚙️ All CLI Flags

[![Flags](https://img.shields.io/badge/CLI-Full%20Reference-00d4ff?logo=terminal)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![Config](https://img.shields.io/badge/Config-oxide--config.toml-557C93?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)

| Flag | Default | Purpose |
|------|---------|---------|
| `--url` | required | Target URL(s) or `-u targets.txt` |
| `--modules` | — | `all` or comma-separated |
| `--zeroday` | false | ML anomaly mode |
| `--multiattack` | false | Scan ≤3 targets concurrently |
| `--active` | false | TCP fingerprinting (sudo) |
| `--insta` | false | Instagram OSINT |
| `--session` | false | Session hijack testing |
| `--headless` | false | Chrome JS crawling |
| `--resume` | false | Resume from checkpoint |
| `--download` | false | Auto-download sensitive files |
| `--train` | false | Train zero-day classifier |
| `--threads` | 20 | Concurrent threads (1–100) |
| `--jobs` | 2 | Parallel crawl workers (1–50) |
| `--duration` | 0 | Scan limit seconds (0=unlimited) |
| `--rate-limit` | 0 | Max req/sec (capped 1000) |
| `--crawl-depth` | 3 | Crawl depth (max 10) |
| `--max-urls` | 100 | Max URLs (max 10000) |
| `--exploitation-level` | 50 | Aggression (1–100) |
| `--payload-limit` | 50 | Max payloads per scan |
| `--proxy` | — | HTTP proxy |
| `--cookie` | — | Session auth |
| `--header` | — | Custom headers (repeatable) |
| `--user-agent` | — | Custom UA |
| `--output` | — | Report path |
| `--format` | json | json/html/csv/xml |
| `--insecure` | false | Skip SSL verify |
| `--follow-redirects` | false | Follow redirects |
| `--max-redirects` | 10 | Max redirects |
| `--silent-mode` | false | Quiet output |
| `--verbose` | false | Detailed output |
| `--list-modules` | — | List & exit (no --url) |
| `--exclude` | — | Modules to skip |

Config file `oxide-config.toml`: persistent threads, timeout, UA, headers, modules.

---

## 📊 Reports

[![Reports](https://img.shields.io/badge/Reports-HTML%20%7C%20JSON%20%7C%20CSV%20%7C%20XML-b388ff?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![Theme](https://img.shields.io/badge/Theme-Cyberpunk%202077-00d4ff?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)

Auto-saved every run to `reports/oxide_<timestamp>.*`:

| Format | Theme | Use Case |
|--------|-------|----------|
| **HTML** | Cyberpunk 2077 (scanlines, gradient, severity glow) | Human review |
| **JSON** | Machine-parsable (`target_ip`, `urls`, `duration`) | Automation |
| **CSV** | Spreadsheet columns | Data analysis |
| **XML** | Tool integration | Pipeline ingest |

Includes: target URL + IP, all discovered URLs, scan duration, per-module findings, severity levels, WAF detection results.

---

## 📜 Changelog

[![Releases](https://img.shields.io/badge/Releases-GitHub-00e676?logo=github)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE/releases)
[![Issues](https://img.shields.io/badge/Issues-Report-ff6b6b?logo=bugatti)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE/issues)

### v7.7.7-elite

```
Added:
  ▪ Zero-Day ML detection engine — standalone anomaly scanning with auto-exploit
  ▪ Fuzz testing phase — 15 payload types, crash/timeout/5xx tracking
  ▪ Cyberpunk 2077 HTML report theme with Kali colour scheme
  ▪ Auto-save reports (HTML + JSON) to reports/ directory
  ▪ WAF detection during reconnaissance phase
  ▪ Per-request timeout (10s) and per-exploit timeout (8s)
  ▪ Headless Chrome JS crawling (--headless)
  ▪ WebSocket fuzzing (SQLi, XSS, CMDi, DoS payloads)
  ▪ API fuzzer (REST + GraphQL, 7 methods, 6 content types)
  ▪ Distributed scanning (master/worker cluster)
  ▪ Instagram OSINT module
  ▪ Session hijack testing
  ▪ Scan checkpoint/resume (--resume)
  ▪ Multi-target concurrent scan (--multiattack)

Changed:
  ▪ Banner gradient: Kali blue-grey → cyan → lavender
  ▪ Duration timer excludes setup overhead
  ▪ --list-modules no longer requires --url
  ▪ Author line: khaninkali [Kali-Linux]

Fixed:
  ▪ Ctrl+C responsiveness — polls shutdown flag every 200ms
  ▪ Vercel false positive — server-timing removed from CF detection
  ▪ Duration enforcement via per-request timeouts + should_continue() checks
  ▪ Panic-safe string slicing across filter.rs, cookies.rs, session.rs, tls_scanner.rs
```

### v7.6.0

```
Initial Community Edition — hybrid pipeline, 13 scanners, HTML/JSON/CSV/XML reports.
```

---

## 🔧 Build

[![Build](https://img.shields.io/badge/Build-Release-00e676?logo=rust)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)
[![Tests](https://img.shields.io/badge/Tests-cargo%20test-557C93?logo=rust)](https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE)

```bash
cargo build --release        # opt-level=3, LTO=fat, stripped, panic=abort
cargo test                   # run tests
./build-ce-deb.sh            # Debian package
```

```
/                   # Main package
├── src/            # Source code (scanner/, zero_day/, ai/, advanced/, cli/...)
├── oxide-proxy/    # Proxy sub-crate (HTTP, SOCKS4/5)
├── hypersecurity/  # Kernel memory safety (libloading)
├── oxide-ce-debian/# DEB packaging
└── arch-pkg/       # Arch packaging
```

---

<p align="center">
  <br>
  <a href="https://www.kali.org/">
    <img src="https://www.kali.org/images/kali-logo.svg" alt="Kali Linux" width="200"/>
  </a>
  <br><br>
  <b style="color:#00d4ff;">Built for Kali Linux · Targeting Official Repository Inclusion</b>
  <br><br>
  <a href="https://github.com/HyperSecurityLabs/OxideCE-v7.7.7ELITE">
    <img src="https://img.shields.io/badge/⭐%20Star%20on%20GitHub-557C93?style=for-the-badge" alt="Star">
  </a>
  <br><br>
  <span style="color:#557C93;"><i>khaninkali | HyperSecurity Offensive Labs</i></span>
</p>
