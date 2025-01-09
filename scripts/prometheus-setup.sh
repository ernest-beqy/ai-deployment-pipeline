#!/bin/bash
echo "Checking for Prometheus..."
if kubectl get pods -n monitoring | grep -q prometheus; then
  echo "Prometheus is already installed."
else
  echo "Installing Prometheus..."
  helm install prometheus prometheus-community/prometheus -n monitoring
fi

