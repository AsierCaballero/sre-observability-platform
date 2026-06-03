#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="${SCRIPT_DIR}/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="sre-backup-${TIMESTAMP}.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "${BACKUP_DIR}/${FILENAME}" \
    -C "$SCRIPT_DIR/.." \
    config/

echo "Backup saved: ${BACKUP_DIR}/${FILENAME}"
ls -lh "${BACKUP_DIR}/${FILENAME}"