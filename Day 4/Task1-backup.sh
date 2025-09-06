#!/bin/bash

####################################
# Author : Shamlin
# Date   : 6th Sep 2025
#
# Version: V1
# File Backup Script
#
# Usage: ./backup.sh <filename>
#####################################

# Configuration
LOGFILE="/var/log/file_backup.log"
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')

# === Check if argument is given ===
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE="$1"


if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found."
    exit 2
fi

#create backup filename
BACKUP_FILE="${FILE}.bak.${TIMESTAMP}"

#Copy it
cp "$FILE" "$BACKUP_FILE"

#Log the backup
echo "$(date '+%Y-%m-%d %H:%M:%S') Backup of '$FILE' created as '$BACKUP_FILE'" >> "$LOGFILE"

echo "Backup successful: $BACKUP_FILE"