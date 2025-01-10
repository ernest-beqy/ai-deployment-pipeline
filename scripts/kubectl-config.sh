#!/bin/bash

echo "Configuring kubectl for multiple clusters..."

# Add context for each cluster
kubectl config set-context cluster-1 --cluster=cluster-1 --user=cluster-1-user --namespace=default
kubectl config set-context cluster-2 --cluster=cluster-2 --user=cluster-2-user --namespace=default
kubectl config set-context cluster-3 --cluster=cluster-3 --user=cluster-3-user --namespace=default
kubectl config set-context cluster-4 --cluster=cluster-4 --user=cluster-4-user --namespace=default
kubectl config set-context cluster-5 --cluster=cluster-5 --user=cluster-5-user --namespace=default

# Set the context for the default cluster
kubectl config use-context cluster-1

