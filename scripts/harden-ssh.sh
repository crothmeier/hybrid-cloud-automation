#!/bin/bash
# Script: harden-ssh.sh
# Purpose: Apply basic SSH security configurations on a Linux server.

CONFIG_FILE="/etc/ssh/sshd_config"

# 1. Disable root login via SSH
if grep -q "^PermitRootLogin" "$CONFIG_FILE"; then
    sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' "$CONFIG_FILE"
else
    echo "PermitRootLogin no" | sudo tee -a "$CONFIG_FILE" >/dev/null
fi
echo "Root login disabled."

# 2. Disable password authentication (only allow key-based SSH)
if grep -q "^PasswordAuthentication" "$CONFIG_FILE"; then
    sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' "$CONFIG_FILE"
else
    echo "PasswordAuthentication no" | sudo tee -a "$CONFIG_FILE" >/dev/null
fi
echo "Password authentication disabled."

echo "Hardened SSH settings applied. (Note: Ensure key-based SSH access is configured before restarting sshd.)"
