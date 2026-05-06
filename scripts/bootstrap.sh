#!/bin/bash

set -e

echo "=================================="
echo " UniMind Bootstrap Starting"
echo "=================================="

./scripts/install-tools.sh

./scripts/install-ssh.sh

./scripts/start-minikube.sh

./scripts/create-namespaces.sh

./scripts/install-postgres.sh

./scripts/install-postgres-backups.sh

./scripts/install-argocd.sh

./scripts/verify-cluster.sh

./scripts/test-helm.sh

echo ""
echo "=================================="
echo " UniMind Bootstrap Complete"
echo "=================================="