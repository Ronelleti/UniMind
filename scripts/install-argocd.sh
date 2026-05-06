#!/bin/bash

set -e

echo "=================================="
echo " Installing ArgoCD"
echo "=================================="

kubectl apply -n argocd -f \
https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo ""
echo "Waiting for ArgoCD server..."

kubectl wait \
  --for=condition=available \
  deployment/argocd-server \
  -n argocd \
  --timeout=600s

echo ""
echo "=================================="
echo " ArgoCD Installed"
echo "=================================="

kubectl get pods -n argocd
