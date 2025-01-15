#!/bin/bash

cd terraform || exit 1
terraform init | tee ../logs/terraform_init.log || { echo "Failed to initialize Terraform"; exit 1; }
terraform apply -auto-approve | tee ../logs/terraform_apply.log || { echo "Terraform apply failed"; exit 1; }
