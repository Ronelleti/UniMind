#!/bin/bash

set -e

echo "=================================="
echo " Creating Namespaces"
echo "=================================="

NAMESPACES=(
  argocd
  monitoring
  database
  ai-services
  unimind-dev
  unimind-staging
  unimind-prod
)

for ns in "${NAMESPACES[@]}"
do
    echo "Creating namespace: $ns"

    kubectl create namespace $ns \
      --dry-run=client -o yaml | kubectl apply -f -
done

echo ""
echo "=================================="
echo " Namespaces Created"
echo "=================================="

kubectl get ns