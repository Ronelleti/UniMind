#!/bin/bash

set -e

echo "=================================="
echo " Opening ArgoCD"
echo "=================================="

ARGO_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d)

VM_IP=$(hostname -I | awk '{print $1}')

echo ""
echo "=================================="
echo " ArgoCD Credentials"
echo "=================================="

echo "Username: admin"
echo "Password: $ARGO_PASSWORD"

echo ""
echo "=================================="
echo " ArgoCD URL"
echo "=================================="

echo "https://$VM_IP:8081"

echo ""
echo "Starting port-forward..."

kubectl port-forward svc/argocd-server \
  -n argocd \
  --address 0.0.0.0 \
  8081:443