#!/bin/bash

set -e

echo "=================================="
echo " Cleaning UniMind Environment"
echo "=================================="

minikube stop || true
minikube delete || true

echo ""
echo "=================================="
echo " Cleanup Complete"
echo "=================================="
