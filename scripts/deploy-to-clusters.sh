#!/bin/bash

for cluster in $(kubectl config get-contexts -o name); do
  echo "Switching to context: $cluster"
  kubectl config use-context "$cluster" | tee -a logs/deploy_clusters.log || { echo "Failed to switch to context $cluster" | tee -a logs/deploy_clusters.log; continue; }
  echo "Applying deployment in $cluster"
  kubectl apply -f kubernetes/deployment.yaml | tee -a logs/deploy_clusters.log || { echo "Failed to apply deployment in $cluster" | tee -a logs/deploy_clusters.log; exit 1; }
  echo "Applying ingress in $cluster"
  kubectl apply -f kubernetes/ingress.yaml | tee -a logs/deploy_clusters.log || { echo "Failed to apply ingress in $cluster" | tee -a logs/deploy_clusters.log; exit 1; }
done
