#!/bin/bash

set -e

echo "=================================="
echo " Testing UniMind Helm Chart"
echo "=================================="

echo ""
echo "Linting chart..."

helm lint helm/unimind

echo ""
echo "Rendering DEV templates..."

helm template unimind-dev helm/unimind \
  -f helm/unimind/values-dev.yaml \
  --namespace unimind-dev

echo ""
echo "Rendering STAGING templates..."

helm template unimind-staging helm/unimind \
  -f helm/unimind/values-staging.yaml \
  --namespace unimind-staging

echo ""
echo "Rendering PROD templates..."

helm template unimind-prod helm/unimind \
  -f helm/unimind/values-prod.yaml \
  --namespace unimind-prod

echo ""
echo "=================================="
echo " Helm Validation Complete"
echo "=================================="
