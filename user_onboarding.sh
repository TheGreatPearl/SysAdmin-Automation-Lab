#!/bin/bash

# ==============================================================================
# Script Name: user_onboarding.sh
# Description: Automates new employee setup (User, Group, Directory, SSH structure)
# Author: Tal
# ==============================================================================

# Ensure script is run with sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "[!] Please run this script with sudo."
  exit 1
fi

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: sudo $0 <username> <group_name>"
    exit 1
fi

USERNAME=$1
GROUP=$2

echo "----------------------------------------"
echo "[*] Starting Onboarding Process for: $USERNAME"
echo "----------------------------------------"

# 1. Create Group if it doesn't exist
if getent group "$GROUP" > /dev/null 2>&1; then
    echo "[+] Group '$GROUP' already exists."
else
    groupadd "$GROUP"
    echo "[+] Created group '$GROUP'."
fi

# 2. Create User with Home Directory and assigned Group
if id "$USERNAME" > /dev/null 2>&1; then
    echo "[!] User '$USERNAME' already exists. Exiting."
    exit 1
else
    useradd -m -g "$GROUP" -s /bin/bash "$USERNAME"
    echo "[+] Created user '$USERNAME' and assigned to group '$GROUP'."

    # Set temporary password and force change upon first login
    TEMP_PASS="TempPassword123!"
    echo "$USERNAME:$TEMP_PASS" | chpasswd
    chage -d 0 "$USERNAME"
    echo "[+] Set temporary password and forced password change on first login."
fi

# 3. Setup SSH directory structure for secure access
USER_HOME="/home/$USERNAME"
mkdir -p "$USER_HOME/.ssh"
chmod 700 "$USER_HOME/.ssh"
touch "$USER_HOME/.ssh/authorized_keys"
chmod 600 "$USER_HOME/.ssh/authorized_keys"
chown -R "$USERNAME:$GROUP" "$USER_HOME/.ssh"

echo "[+] Configured SSH key directory at $USER_HOME/.ssh"
echo "----------------------------------------"
echo "[V] Onboarding completed successfully for $USERNAME!"
echo "----------------------------------------"
