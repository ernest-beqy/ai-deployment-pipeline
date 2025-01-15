#!/bin/bash

echo "Checking for Prometheus..." | tee -a logs/prometheus_setup.log
if kubectl get pods -n monitoring | grep -q prometheus; then
  echo "Prometheus is already installed." | tee -a logs/prometheus_setup.log
else
  echo "Prometheus is not installed. Installing..." | tee -a logs/prometheus_setup.log
  kubectl create namespace monitoring 2>/dev/null || echo "Namespace monitoring already exists or creation failed" | tee -a logs/prometheus_setup.log
  helm install prometheus prometheus-community/prometheus --namespace monitoring --version 15.10.0 | tee -a logs/prometheus_setup.log || { 
    echo "Error installing Prometheus" | tee -a logs/prometheus_setup.log; 
    exit 1; 
  }
fi
