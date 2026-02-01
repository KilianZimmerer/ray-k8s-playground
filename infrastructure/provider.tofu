provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  allowed_account_ids = [var.aws_account_id]
}

terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "3.1.1"
    }
  }
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name = "ray-k8s-playground"
  vpc_cidr     = "10.0.0.0/16"
  azs          = slice(data.aws_availability_zones.available.names, 0, 3)
}

terraform {
  backend "s3" {
    bucket         = "tofu-backend-${var.aws_account_id}"
    key            = "ray-k8s-playground/main.tfstate"
    region         = var.aws_region
    profile        = var.aws_profile
  }
}
