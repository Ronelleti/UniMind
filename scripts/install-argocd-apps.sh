#!/bin/bash

set -e

echo "=================================="
echo " Installing ArgoCD Applications"
echo "=================================="

kubectl apply -f argocd/apps/unimind-dev.yaml

kubectl apply -f argocd/apps/unimind-staging.yaml

kubectl apply -f argocd/apps/unimind-prod.yaml

echo ""
echo "=================================="
echo " ArgoCD Applications Installed"
echo "=================================="

kubectl get applications -n argocd
