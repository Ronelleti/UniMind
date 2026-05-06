#!/bin/bash

set -e

echo "=================================="
echo " Installing VSCodium"
echo "=================================="

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
| gpg --dearmor \
| sudo tee /usr/share/keyrings/vscodium-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main" \
| sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update

sudo apt install -y codium

echo ""
echo "=================================="
echo " VSCodium Installed"
echo "=================================="
