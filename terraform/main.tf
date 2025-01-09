provider "aws" {
  region = "us-east-1"
}
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "ai-app-cluster"
}
