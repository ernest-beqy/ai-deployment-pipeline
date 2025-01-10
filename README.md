![Visits Badge](https://badges.pufler.dev/visits/ernest-beqy/ai-deployment-pipeline)
![GitHub Repo Stars](https://img.shields.io/github/stars/ernest-beqy/ai-deployment-pipeline)
![GitHub Forks](https://img.shields.io/github/forks/ernest-beqy/ai-deployment-pipeline)
![GitHub Issues](https://img.shields.io/github/issues/ernest-beqy/ai-deployment-pipeline)
![GitHub License](https://img.shields.io/github/license/ernest-beqy/ai-deployment-pipeline)

# Fullstack AI-Powered Application Deployment on Multi-Kubernetes Clusters 🚀

This repository contains the necessary configurations, scripts, and tools for
deploying a fullstack AI-powered application on multiple Kubernetes (K8s)
clusters. The deployment involves various components like Kubernetes, Terraform,
Helm, Prometheus, GitLab CI/CD, and more.

## Architecture Overview 🏗️

The setup utilizes the following technologies:
- **Kubernetes**: For container orchestration and deploying the app across
multiple clusters.
- **Terraform**: For provisioning the required infrastructure (EKS clusters).
- **Helm**: For managing Kubernetes applications with charts.
- **Prometheus**: For monitoring and metrics collection, configured to run
in a multi-cluster setup.
- **GitLab CI/CD**: For automating the build, test, and deployment process.

## Project Structure 🗂️

```plaintext
.
├── .gitlab-ci.yml                      # GitLab CI pipeline configuration
├── kubernetes/
│   ├── deployment.yaml                 # Kubernetes deployment file (your app deployment spec)
│   ├── prometheus-federation.yaml      # Prometheus federation configuration for multi-cluster
│   └── ingress.yaml                    # Ingress configuration for routing traffic
├── terraform/
│   ├── eks-cluster.tf                  # Terraform script to provision EKS clusters
│   ├── prometheus.tf                   # Terraform script for deploying Prometheus using Helm
│   ├── main.tf                         # Main Terraform configuration file for multi-cluster provisioning
│   └── outputs.tf                      # Terraform outputs (e.g., cluster details)
├── helm/
│   ├── mychart/
│   │   ├── Chart.yaml                  # Helm chart metadata
│   │   ├── values.yaml                 # Default configuration values for the chart
│   │   ├── templates/
│   │   │   ├── deployment.yaml        # Helm template for app deployment
│   │   │   └── service.yaml           # Helm template for app service
│   └── values-production.yaml         # Helm chart production values
├── scripts/
│   ├── prometheus-setup.sh             # Script for checking/installing Prometheus
│   ├── kubectl-config.sh               # Script for configuring kubectl context for multiple clusters
│   └── deploy-to-clusters.sh           # Script to deploy to all clusters
└── .gitignore                          # Git ignore file
```

### **Key Components:**
- **CI/CD Pipeline (`.gitlab-ci.yml`)**: Automates the build, testing, and deployment
process using GitLab CI.
- **Kubernetes Configuration (`kubernetes/`)**: Manages Kubernetes deployment, services,
and Ingress configurations.
- **Terraform Configuration (`terraform/`)**: Automates the provisioning of EKS clusters
and Prometheus using Terraform.
- **Helm Charts (`helm/`)**: Defines the application deployment and service configuration
using Helm.
- **Scripts (`scripts/`)**: Custom scripts to check for Prometheus installation, configure
`kubectl` contexts for multiple clusters, and deploy the application to all clusters.

<br></br>

## Prerequisites ⚙️

Before you begin, ensure you have the following tools installed:
- **Terraform**: To provision infrastructure.
- **kubectl**: To manage Kubernetes clusters.
- **Helm**: To deploy Kubernetes applications.
- **Prometheus**: For monitoring and federating data.
- **GitLab CI/CD**: For running CI/CD pipelines.
- **AWS CLI**: If you're using EKS for cluster provisioning.
  
Ensure your AWS credentials are configured properly if using AWS for
provisioning clusters.

<br></br>

## Setup Instructions 🔧

### 1. Provision Infrastructure with Terraform 🌱
Run the following Terraform commands to provision your infrastructure:

```bash
cd terraform/
terraform init
terraform apply
```

This will provision EKS clusters and other necessary resources as specified in
the `eks-cluster.tf` and `main.tf` files.

<br></br>

### 2. Install Prometheus using Helm 📊
Deploy Prometheus to your clusters by running the following command:

```bash
cd terraform/
terraform apply -target=helm_release.prometheus
```

Alternatively, you can run the Prometheus setup script (`scripts/prometheus-setup.sh`)
to check if Prometheus is already installed and set it up if necessary.

<br></br>

### 3. Deploy Application to Clusters 🖥️
Use the `deploy-to-clusters.sh` script to deploy your application to all Kubernetes clusters:

```bash
cd scripts/
./deploy-to-clusters.sh
```

<br></br>

### 4. Configure `kubectl` for Multiple Clusters 🌐
Run the `kubectl-config.sh` script to configure `kubectl` for multiple clusters:

```bash
cd scripts/
./kubectl-config.sh
```

This will set up `kubectl` contexts for all five clusters.

<br></br>

### 5. Accessing the Application 🌍
Once the application is deployed, you can access it via the LoadBalancer or Ingress service
as defined in the Kubernetes configuration.

---
<br></br>

## CI/CD Pipeline with GitLab CI 🚀

The `.gitlab-ci.yml` file contains the configuration for GitLab CI. It includes:
- **Build**: Builds the Docker image for the application.
- **Deploy**: Deploys the app to all Kubernetes clusters using the `deploy-to-clusters.sh` script.

To trigger the pipeline, push your changes to GitLab and monitor the pipeline's progress.

---
<br></br>

## Monitoring with Prometheus 📈

Prometheus is configured for monitoring across multiple Kubernetes clusters. It collects metrics
from the application and federates data across all clusters using the `prometheus-federation.yaml`
file.

---
<br></br>

## Troubleshooting 🛠️

- **Prometheus setup**: If Prometheus is not installed or configured correctly, run the
`prometheus-setup.sh` script to fix the issue.
- **Deployment Issues**: If your application is not deploying correctly, check the logs in Kubernetes
using `kubectl logs` and ensure that your Kubernetes configurations are correct.
- **CI/CD Issues**: Review the GitLab CI pipeline logs to debug any errors in the build or deployment
process.

---
<br></br>

## License 📜

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
