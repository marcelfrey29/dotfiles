#!/usr/bin/env bash

echo "[INFO] Adding SSH Key to Remote Machine..."

# Create Key Pair if it doesn't exist.
keyPath=".ssh/"
cd # Navigate home
mkdir -p $keyPath
cd $keyPath

fileName="remote-machines"
if ! [ -f "$fileName" ]; then
    echo "[INFO] Creating new SSH key pair..."
    ssh-keygen -t rsa -b 4096 -C "Remote Machine Access" -f $fileName
    echo "[INFO] Created new SSH key pair."

    # Add to Keychain
    echo "[INFO] Adding SSH Key to System Keychain..."
    ssh-add -K $piName
    echo "[INFO] Adding SSH Key."

    # Append SSH Config File
    echo "[INFO] Appending SSH Config file..."
    echo "IdentityFile ~/.ssh/$fileName" >> config
    echo "[INFO] Updated SSH Config."
else
    echo "[INFO] SSH key pair already exists."
fi

# Configuration Data
read -p "IP Address of the Remote Machine: " remoteIp;
read -p "Remote Username ($remoteIp): " remoteUser;

# Copy
echo "[INFO] Coping SSH Public Key to Remote $remoteIp..."
ssh-copy-id -i "$fileName.pub" $remoteUser@$remoteIp
echo "[INFO] Copied SSH Key."

# Finish
echo "[INFO] Added SSH Key to Remote Machine."
