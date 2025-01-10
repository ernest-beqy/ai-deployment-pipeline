#!/bin/bash

echo "Checking for Prometheus..."
if kubectl get pods -n monitoring | grep -q prometheus; then
  echo "Prometheus is already installed."
else
  echo "Prometheus is not installed. Installing..."
  helm install prometheus prometheus-community/prometheus --namespace monitoring --create-namespace
fi
