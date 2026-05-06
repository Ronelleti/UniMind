#!/bin/bash

set -e

echo "=================================="
echo " UniMind Bootstrap Starting"
echo "=================================="

./scripts/install-tools.sh
./scripts/install-ssh.sh
./scripts/start-minikube.sh
./scripts/create-namespaces.sh
./scripts/verify-cluster.sh
./scripts/install-postgres.sh

echo ""
echo "=================================="
echo " UniMind Bootstrap Complete"
echo "=================================="
