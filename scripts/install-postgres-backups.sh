#!/bin/bash

set -e

echo "=================================="
echo " Installing PostgreSQL Backups"
echo "=================================="

kubectl apply -f k8s/postgres/postgres-backup-pvc.yaml

kubectl apply -f k8s/postgres/postgres-backup-cronjob.yaml

echo ""
echo "=================================="
echo " PostgreSQL Backup System Installed"
echo "=================================="

kubectl get cronjobs -n database
kubectl get pvc -n database
