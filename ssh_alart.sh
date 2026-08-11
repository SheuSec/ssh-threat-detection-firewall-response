#!/bin/bash

# SSH Threat Detection Script
# This script checks the Ubuntu authentication log
# for failed SSH authentication attempts and invalid users.

LOG_FILE="/var/log/auth.log"
ALERT_FILE="$HOME/security_alarts.log"

echo "========================================" >> "$ALERT_FILE"
echo "SSH Security Check - $(date)" >> "$ALERT_FILE"
echo "========================================" >> "$ALERT_FILE"

echo "[+] Failed SSH authentication attempts:" >> "$ALERT_FILE"
grep -Ei "Failed password|Invalid user" "$LOG_FILE" | tail -10 >> "$ALERT_FILE"

echo "" >> "$ALERT_FILE"
echo "[+] SSH security check completed." >> "$ALERT_FILE"
echo "" >> "$ALERT_FILE"
