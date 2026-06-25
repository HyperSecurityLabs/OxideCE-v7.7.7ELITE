#!/usr/bin/env bash
set -euo pipefail

PROJECT="OXIDE Community Edition v8.5.0"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
DISPLAY_FILE="$SRC_DIR/src/cli/display.rs"

# ── Tokyo Night palette ────────────────────────────────────────────────
TN_BG="40,  40,  40"
TN_FG="192, 202, 245"
TN_FG0="192, 202, 245"
TN_RED="247, 118, 142"
TN_RED_B="247, 118, 142"
TN_GRN="158, 206, 106"
TN_GRN_B="158, 206, 106"
TN_YLW="224, 175, 104"
TN_YLW_B="224, 175, 104"
TN_BLU="122, 162, 247"
TN_BLU_B="122, 162, 247"
TN_PUR="187, 154, 247"
TN_PUR_B="187, 154, 247"
TN_AQU="125, 207, 255"
TN_AQU_B="125, 207, 255"
TN_ORG="255, 158, 100"
TN_ORG_B="255, 158, 100"
TN_GRY="86,  95,  137"
TN_GRY_B="86,  95,  137"

# ── Gruvbox Dark palette ──────────────────────────────────────────────
GB_BG="40,  40,  40"
GB_FG="235, 219, 178"
GB_FG0="251, 241, 199"
GB_RED="204, 36,  29"
GB_RED_B="251, 73,  52"
GB_GRN="152, 151, 26"
GB_GRN_B="184, 187, 38"
GB_YLW="215, 153, 33"
GB_YLW_B="250, 189, 47"
GB_BLU="69,  133, 136"
GB_BLU_B="131, 165, 152"
GB_PUR="177, 98,  134"
GB_PUR_B="211, 134, 155"
GB_AQU="104, 157, 106"
GB_AQU_B="142, 192, 124"
GB_ORG="214, 93,  14"
GB_ORG_B="254, 128, 25"
GB_GRY="146, 131, 116"
GB_GRY_B="168, 153, 132"

usage() {
    cat <<EOF
Usage: $0 [OPTIONS]

Themes:
  --tokyo-night    Apply Tokyo Night theme to display colors
  --revert-theme   Revert to original Gruvbox Dark

Database:
  --build-db       Rebuild encrypted SQLite DB from CSVs

Build:
  --release        Build in release mode (default: debug)
  --gui            Build CLI + GUI together
  --install        Copy release binaries into the release folder
  --help           Show this help

Examples:
  $0                                debug build, gruvbox
  $0 --release                      release build
  $0 --tokyo-night --release        release build, tokyo night
  $0 --release --gui                release build with GUI
  $0 --release --gui --install      build + copy to release dir
  $0 --build-db                     rebuild encrypted DB only
EOF
}

TOKYO=false
REVERT=false
RELEASE=false
BUILD_DB=false
BUILD_GUI=false
INSTALL=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --tokyo-night)  TOKYO=true ;;
        --revert-theme) REVERT=true ;;
        --build-db)     BUILD_DB=true ;;
        --release)      RELEASE=true ;;
        --gui)          BUILD_GUI=true ;;
        --install)      INSTALL=true ;;
        --help)         usage; exit 0 ;;
        *) echo "Unknown: $1"; usage; exit 1 ;;
    esac
    shift
done

cd "$SRC_DIR"

if [[ "$BUILD_DB" == true ]]; then
    echo "[*] Rebuilding encrypted SQLite database from CSVs ..."
    python3 tools/build_db.py
    echo "[+] Done."
    exit 0
fi

apply_theme() {
    local prefix="$1"
    shift
    while [[ $# -gt 0 ]]; do
        local name="$1" val="$2"
        local pad
        pad=$(printf '%*s' $((13 - ${#name})) '')
        sed -i "s/^pub const ${prefix}${name}:.*/pub const ${prefix}${name}:${pad} (u8, u8, u8) = (${val});/" "$DISPLAY_FILE"
        shift 2
    done
}

if [[ "$TOKYO" == true ]]; then
    echo "[*] Applying Tokyo Night theme ..."
    apply_theme "GB_" \
        BG    "$TN_BG"    FG    "$TN_FG"    FG0   "$TN_FG0" \
        RED   "$TN_RED"   RED_B "$TN_RED_B" \
        GRN   "$TN_GRN"   GRN_B "$TN_GRN_B" \
        YLW   "$TN_YLW"   YLW_B "$TN_YLW_B" \
        BLU   "$TN_BLU"   BLU_B "$TN_BLU_B" \
        PUR   "$TN_PUR"   PUR_B "$TN_PUR_B" \
        AQU   "$TN_AQU"   AQU_B "$TN_AQU_B" \
        ORG   "$TN_ORG"   ORG_B "$TN_ORG_B" \
        GRY   "$TN_GRY"   GRY_B "$TN_GRY_B"
    echo "[+] Tokyo Night applied."
    cargo check -j2 2>&1 | grep -E "^error" && { echo "[!] Compilation failed"; exit 1; } || echo "[+] Source OK."
fi

if [[ "$REVERT" == true ]]; then
    echo "[*] Reverting to Gruvbox Dark ..."
    apply_theme "GB_" \
        BG    "$GB_BG"    FG    "$GB_FG"    FG0   "$GB_FG0" \
        RED   "$GB_RED"   RED_B "$GB_RED_B" \
        GRN   "$GB_GRN"   GRN_B "$GB_GRN_B" \
        YLW   "$GB_YLW"   YLW_B "$GB_YLW_B" \
        BLU   "$GB_BLU"   BLU_B "$GB_BLU_B" \
        PUR   "$GB_PUR"   PUR_B "$GB_PUR_B" \
        AQU   "$GB_AQU"   AQU_B "$GB_AQU_B" \
        ORG   "$GB_ORG"   ORG_B "$GB_ORG_B" \
        GRY   "$GB_GRY"   GRY_B "$GB_GRY_B"
    echo "[+] Original theme restored."
    cargo check -j2 2>&1 | grep -E "^error" && { echo "[!] Compilation failed"; exit 1; } || echo "[+] Source OK."
fi

BIN_NAME=$(grep -m1 '^name *= *"' "$SRC_DIR/Cargo.toml" | sed 's/.*"\(.*\)".*/\1/')
TARGET="${CARGO_BUILD_TARGET:-$(rustc -vV | grep host | awk '{print $2}')}"
TARGET_DIR="$SRC_DIR/target/$TARGET/release"

BUILD_FLAGS="--target $TARGET"
[[ "$RELEASE" == true ]] && BUILD_FLAGS="$BUILD_FLAGS --release"

echo "[*] Building $BIN_NAME (target: $TARGET, mode: $([[ "$RELEASE" == true ]] && echo release || echo debug))..."
cargo build $BUILD_FLAGS -j2

if [[ "$BUILD_GUI" == true ]]; then
    echo "[*] Building oxide-gui ..."
    cargo build $BUILD_FLAGS --manifest-path "$SRC_DIR/gui/Cargo.toml" -j2
    GUI_BIN=$(grep -m1 '^name *= *"' "$SRC_DIR/gui/Cargo.toml" | sed 's/.*"\(.*\)".*/\1/')
fi

echo "[+] Done. Binaries:"
ls -lh "$TARGET_DIR/$BIN_NAME" 2>/dev/null || echo "    CLI: (check $TARGET_DIR)"
if [[ "$BUILD_GUI" == true ]]; then
    ls -lh "$SRC_DIR/gui/target/$TARGET/release/$GUI_BIN" 2>/dev/null ||
    ls -lh "$SRC_DIR/gui/target/release/$GUI_BIN" 2>/dev/null ||
    echo "    GUI: (check gui/target)"
fi

if [[ "$INSTALL" == true && "$RELEASE" == true ]]; then
    INSTALL_DIR="$SRC_DIR/OxideCE-v8.5.0-community/Linux"
    mkdir -p "$INSTALL_DIR/bin"
    cp "$TARGET_DIR/$BIN_NAME" "$INSTALL_DIR/bin/oxide-ce"
    echo "[+] Installed binary to $INSTALL_DIR/bin/oxide-ce"
    if [[ "$BUILD_GUI" == true ]]; then
        GUI_SRC="$SRC_DIR/gui/target/$TARGET/release/$GUI_BIN"
        [[ -f "$GUI_SRC" ]] || GUI_SRC="$SRC_DIR/gui/target/release/$GUI_BIN"
        cp "$GUI_SRC" "$INSTALL_DIR/bin/oxide-gui" 2>/dev/null && echo "[+] Installed GUI to $INSTALL_DIR/bin/oxide-gui" || true
    fi
elif [[ "$INSTALL" == true ]]; then
    echo "[!] --install requires --release; skipping"
fi
