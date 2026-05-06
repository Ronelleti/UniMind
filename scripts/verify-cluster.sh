#!/bin/bash

set -e

echo "=================================="
echo " UniMind Cluster Verification"
echo "=================================="

echo ""
echo "Nodes:"
kubectl get nodes

echo ""
echo "Namespaces:"
kubectl get ns

echo ""
echo "Pods:"
kubectl get pods -A

echo ""
echo "Ingress:"
kubectl get pods -n ingress-nginx

echo ""
echo "Storage Classes:"
kubectl get storageclass

echo ""
echo "=================================="
echo " Verification Complete"
echo "=================================="
