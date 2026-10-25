#!/bin/bash

# ==============================================================================
# Script Name: health_check.sh
# Description: Monitors system health (Disk usage, Memory, and Critical Services)
# Author: Tal
# ==============================================================================

echo "----------------------------------------"
echo "[*] Starting System Health Check..."
echo "----------------------------------------"

# 1. Check Disk Usage (Root partition)
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')
echo "[i] Root partition disk usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "[!] Warning: Disk usage is above 80%!"
else
    echo "[+] Disk usage is within safe limits."
fi

# 2. Check Memory (RAM) Usage
MEMORY_INFO=$(free -m | awk 'NR==2{printf "Total: %sMB | Used: %sMB | Free: %sMB", $2, $3, $4}')
echo "[+] Memory Status: $MEMORY_INFO"

# 3. Check Critical Service Status (e.g., ssh)
SERVICE="ssh"
if systemctl is-active --quiet "$SERVICE"; then
    echo "[+] Service '$SERVICE' is active and running."
else
    echo "[!] Warning: Service '$SERVICE' is NOT running!"
fi

echo "----------------------------------------"
echo "[V] Health check completed successfully!"
echo "----------------------------------------"
