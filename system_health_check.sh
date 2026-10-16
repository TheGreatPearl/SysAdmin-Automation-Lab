#!/bin/bash

echo "========================================"
echo "    SYSTEM HEALTH CHECK REPORT"
echo "========================================"
echo "Date: $(date)"
echo "----------------------------------------"

# 1. Check Disk Usage
echo "[*] Checking Disk Usage..."
df -h / | awk 'NR==2 {print "Root Partition Usage: " $5 " used (" $4 " free)"}'

# 2. Check Memory Usage
echo -e "\n[*] Checking Memory (RAM) Usage..."
free -m | awk 'NR==2 {printf "Memory Usage: Used %sMB / Total %sMB (%.2f%%)\n", $3, $2, $3*100/$2}'

# 3. Check SSH Service Status
echo -e "\n[*] Checking SSH Service Status..."
if systemctl is-active --quiet ssh; then
    echo "[+] SSH Service is running smoothly."
else
    echo "[!] WARNING: SSH Service is DOWN!"
fi

echo "----------------------------------------"
echo "Health Check Completed."
echo "========================================"

