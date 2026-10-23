#!/usr/bin/env bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.local/bin"
chmod +x "$DIR/prosvet"
ln -sf "$DIR/prosvet" "$HOME/.local/bin/prosvet"
echo "[ok] installed: ~/.local/bin/prosvet"
echo "Next: prosvet install-engine && prosvet auto && prosvet start"
