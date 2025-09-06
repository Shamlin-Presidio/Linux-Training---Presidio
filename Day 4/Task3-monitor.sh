#!/bin/bash

####################################
# Author : Shamlin
# Date   : 6th Sep 2025
#
# Version: V1
# Simple Monitoring Script
#
# Usage: ./monitor.sh
#####################################


LOG_FILE="/var/log/cpu_alerts.log"

# Get the 1-minute load average using 'uptime'
LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1 | xargs)

# uptim gives system load, we use awk to get load average and take the first value(1-min avg)

THRESHOLD=2.0

IS_HIGH=$(echo "$LOAD > $THRESHOLD" | bc)

# log an alert
if [ "$IS_HIGH" -eq 1 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ALERT: High CPU load detected! Load: $LOAD" >> "$LOG_FILE"
fi
