#!/bin/bash

set -e

echo "=================================="
echo " Installing OpenSSH Server"
echo "=================================="

if dpkg -l | grep -q openssh-server; then
    echo "OpenSSH already installed"
else
    sudo apt update
    sudo apt install -y openssh-server
fi

echo "Enabling SSH service..."

sudo systemctl enable ssh
sudo systemctl restart ssh

echo ""
echo "=================================="
echo " SSH Status"
echo "=================================="

sudo systemctl status ssh --no-pager

echo ""
echo "=================================="
echo " SSH Installation Complete"
echo "=================================="