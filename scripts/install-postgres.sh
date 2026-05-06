#!/bin/bash

set -e

echo "=================================="
echo " Installing PostgreSQL"
echo "=================================="

kubectl apply -f k8s/postgres/postgres-secret.yaml

kubectl apply -f k8s/postgres/postgres-pvc.yaml

kubectl apply -f k8s/postgres/postgres-deployment.yaml

kubectl apply -f k8s/postgres/postgres-service.yaml

echo ""
echo "Waiting for PostgreSQL..."

kubectl wait \
  --for=condition=available \
  deployment/postgres \
  -n database \
  --timeout=300s

echo ""
echo "=================================="
echo " PostgreSQL Installed"
echo "=================================="

kubectl get pods -n database
kubectl get svc -n database
kubectl get pvc -n database