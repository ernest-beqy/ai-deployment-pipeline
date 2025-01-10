#!/bin/bash

for cluster in $(kubectl config get-contexts -o name); do
  kubectl config use-context "$cluster"
  kubectl apply -f kubernetes/deployment.yaml
  kubectl apply -f kubernetes/ingress.yaml
done

