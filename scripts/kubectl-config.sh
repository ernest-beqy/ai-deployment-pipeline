#!/bin/bash

echo "Configuring kubectl for multiple clusters..." | tee -a logs/kubectl_config.log

clusters=("cluster-1" "cluster-2" "cluster-3" "cluster-4" "cluster-5")

for cluster in "${clusters[@]}"; do
  kubectl config set-context "$cluster" --cluster="$cluster" --user="$cluster-user" --namespace=default | tee -a logs/kubectl_config.log || { echo "Failed to set context for $cluster" | tee -a logs/kubectl_config.log; exit 1; }
done

kubectl config use-context cluster-1 | tee -a logs/kubectl_config.log || { echo "Failed to set default context to cluster-1" | tee -a logs/kubectl_config.log; exit 1; }
