#!/bin/bash

set -e

echo "=================================="
echo " Testing PostgreSQL Backup System"
echo "=================================="

echo ""
echo "Creating manual backup job..."

kubectl create job \
  --from=cronjob/postgres-backup \
  manual-backup-$(date +%s) \
  -n database

echo ""
echo "Waiting for job pod..."

sleep 10

echo ""
echo "Current jobs:"
kubectl get jobs -n database

echo ""
echo "Current pods:"
kubectl get pods -n database

echo ""
echo "=================================="
echo " Backup Test Triggered"
echo "=================================="
echo "Check logs with:"
echo ""
echo "kubectl logs -n database job/<job-name>"
