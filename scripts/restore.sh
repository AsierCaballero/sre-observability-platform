#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <backup-file>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File not found: $1"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMP_DIR=$(mktemp -d)

tar -xzf "$1" -C "$TEMP_DIR"

if [ -d "$TEMP_DIR/config" ]; then
    cp -rn "$TEMP_DIR/config/"* "$SCRIPT_DIR/../config/"
    echo "Configuration restored from $1"
else
    echo "Error: No config directory in backup"
    exit 1
fi

rm -rf "$TEMP_DIR"