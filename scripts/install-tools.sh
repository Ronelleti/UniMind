#!/bin/bash

set -e

echo "=================================="
echo " UniMind Tools Installation"
echo "=================================="

ARCH=$(uname -m)

echo "Detected architecture: $ARCH"

if [[ "$ARCH" == "x86_64" ]]; then
    KUBE_ARCH="amd64"
    MINI_ARCH="amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    KUBE_ARCH="arm64"
    MINI_ARCH="arm64"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

echo "Using Kubernetes architecture: $KUBE_ARCH"

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing base packages..."

sudo apt install -y \
    curl \
    wget \
    git \
    unzip \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    jq \
    software-properties-common

# =========================
# Docker
# =========================

echo "Installing Docker..."

if ! command -v docker &> /dev/null; then

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo \
    "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
    https://download.docker.com/linux/ubuntu \
    noble stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update

    sudo apt install -y docker-ce docker-ce-cli containerd.io

    sudo usermod -aG docker $USER

else
    echo "Docker already installed"
fi

# =========================
# kubectl
# =========================

echo "Installing kubectl..."

curl -LO "https://dl.k8s.io/release/$(curl -L -s \
https://dl.k8s.io/release/stable.txt)/bin/linux/${KUBE_ARCH}/kubectl"

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

# =========================
# Minikube
# =========================

echo "Installing Minikube..."

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-${MINI_ARCH}

chmod +x minikube-linux-${MINI_ARCH}

sudo mv minikube-linux-${MINI_ARCH} /usr/local/bin/minikube

# =========================
# Helm
# =========================

echo "Installing Helm..."

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# =========================
# Terraform
# =========================

echo "Installing Terraform..."

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com noble main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt install -y terraform

# =========================
# Verification
# =========================

echo ""
echo "=================================="
echo " Installed Versions"
echo "=================================="

docker --version
kubectl version --client
minikube version
helm version
terraform version

echo ""
echo "=================================="
echo " Installation Complete"
echo "=================================="
echo "IMPORTANT: Reboot VM before continuing!"