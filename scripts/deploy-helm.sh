#!/bin/bash

set -e

ENV=$1

if [ -z "$ENV" ]; then
  echo "Usage:"
  echo "./scripts/deploy-helm.sh dev|staging|prod"
  exit 1
fi

echo "=================================="
echo " Deploying UniMind: $ENV"
echo "=================================="

helm upgrade --install unimind-$ENV helm/unimind \
  -f helm/unimind/values-$ENV.yaml \
  --namespace unimind-$ENV

echo ""
echo "=================================="
echo " Deployment Complete"
echo "=================================="

kubectl get all -n unimind-$ENV
