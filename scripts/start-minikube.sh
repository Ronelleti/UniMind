#!/bin/bash

set -e

echo "=================================="
echo " Starting Minikube"
echo "=================================="

if minikube status | grep -q "Running"; then
    echo "Minikube already running"
    exit 0
fi

minikube start \
  --driver=docker \
  --cpus=4 \
  --memory=8192 \
  --disk-size=30g \
  --kubernetes-version=stable

echo ""
echo "Enabling addons..."

minikube addons enable ingress
minikube addons enable metrics-server
minikube addons enable storage-provisioner
minikube addons enable default-storageclass

echo ""
echo "Waiting for nodes..."

kubectl wait --for=condition=Ready nodes --all --timeout=300s

echo ""
echo "=================================="
echo " Cluster Status"
echo "=================================="

kubectl get nodes
kubectl get pods -A

echo ""
echo "=================================="
echo " Minikube Ready"
echo "=================================="