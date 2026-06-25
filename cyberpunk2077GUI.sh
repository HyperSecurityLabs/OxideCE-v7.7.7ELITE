#!/usr/bin/env bash
set -euo pipefail

PROJECT="OXIDE Community Edition — CyberPunk2077 Interface GUI"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"

# ── CyberPunk2077 palette ───────────────────────────────────────────────
CP_YLW="255, 229, 100"
CP_YLW_B="255, 229, 100"
CP_RED="255, 65,  54"
CP_RED_B="255, 65,  54"
CP_BLU="0,   255, 255"
CP_BLU_B="0,   255, 255"
CP_GRN="0,   255, 128"
CP_GRN_B="0,   255, 128"
CP_PUR="200, 120, 255"
CP_PUR_B="200, 120, 255"
CP_ORG="255, 158, 50"
CP_ORG_B="255, 158, 50"
CP_GRY="120, 120, 140"
CP_GRY_B="120, 120, 140"
CP_BG="10,  10,  24"
CP_FG="200, 220, 255"

usage() {
    cat <<EOF
Usage: $0 [OPTIONS]

Target:
  --release       Build in release mode (default: debug)
  --cross-win     Cross-compile for Windows (x86_64-pc-windows-gnu)
  --clean         Remove old build artifacts first
  --install       Copy built binary into the release folder
  --help          Show this help

Examples:
  $0                          debug build
  $0 --release               release build
  $0 --release --cross-win    cross-compile Windows GUI
  $0 --release --install     build + copy to release dir
EOF
}

RELEASE=false
CROSS_WIN=false
CLEAN=false
INSTALL=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --release)    RELEASE=true ;;
        --cross-win)  CROSS_WIN=true ;;
        --clean)      CLEAN=true ;;
        --install)    INSTALL=true ;;
        --help)       usage; exit 0 ;;
        *) echo "Unknown: $1"; usage; exit 1 ;;
    esac
    shift
done

cd "$SRC_DIR/gui"

if [[ "$CLEAN" == true ]]; then
    echo "[*] Cleaning GUI build artifacts ..."
    cargo clean 2>/dev/null || true
    rm -rf target 2>/dev/null || true
fi

if [[ "$CROSS_WIN" == true ]]; then
    echo "[*] Cross-compiling $PROJECT for Windows (x86_64-pc-windows-gnu) ..."
    if [[ "$RELEASE" == true ]]; then
        cargo build --release --target x86_64-pc-windows-gnu
        BINARY="$SRC_DIR/gui/target/x86_64-pc-windows-gnu/release/oxide-gui.exe"
    else
        cargo build --target x86_64-pc-windows-gnu
        BINARY="$SRC_DIR/gui/target/x86_64-pc-windows-gnu/debug/oxide-gui.exe"
    fi
    echo "[+] Windows GUI: $BINARY"
    INSTALL_DIR="$SRC_DIR/OxideCE-v8.5.0-community/Windows"
    if [[ "$INSTALL" == true && -f "$BINARY" ]]; then
        mkdir -p "$INSTALL_DIR"
        cp "$BINARY" "$INSTALL_DIR/oxide-gui.exe"
        echo "[+] Installed to $INSTALL_DIR/oxide-gui.exe"
    fi
    exit 0
fi

if [[ "$RELEASE" == true ]]; then
    echo "[*] Building $PROJECT in release mode ..."
    cargo build --release
    echo "[+] Binary: $SRC_DIR/gui/target/release/oxide-gui"
else
    echo "[*] Building $PROJECT in debug mode ..."
    cargo build
    echo "[+] Binary: $SRC_DIR/gui/target/debug/oxide-gui"
fi

if [[ "$INSTALL" == true ]]; then
    if [[ "$RELEASE" == true ]]; then
        INSTALL_DIR="$SRC_DIR/OxideCE-v8.5.0-community/Linux"
        mkdir -p "$INSTALL_DIR"
        cp "$SRC_DIR/gui/target/release/oxide-gui" "$INSTALL_DIR/bin/oxide-gui"
        echo "[+] Installed to $INSTALL_DIR/bin/oxide-gui"
    else
        echo "[!] --install only copies release builds; skipping"
    fi
fi
