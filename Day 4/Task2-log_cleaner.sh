#!/bin/bash

####################################
# Author : Shamlin
# Date   : 6th Sep 2025
#
# Version: V1
# Log Cleaning Script
#
# Usage: ./backup.sh <filename>
#####################################
#
LOG_DIR="/var/tmp"

# log file for log clean
CLEANUP_LOG="/var/log/log_cleanup_activity.log"


touch "$CLEANUP_LOG"

echo "[$(date)] Starting log cleanup..." >> "$CLEANUP_LOG"

find "$LOG_DIR" -type f -name "*.log" -mtime +7 -print -delete >> "$CLEANUP_LOG"

echo "[$(date)] Log cleanup complete." >> "$CLEANUP_LOG"