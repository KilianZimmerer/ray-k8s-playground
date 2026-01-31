provider "aws" {
  region  = "eu-central-1"
  profile = "private"
  allowed_account_ids = ["066355930280"]
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
    bucket         = "tofu-backend-066355930280"
    key            = "ray-k8s-playground/main.tfstate"
    region         = "eu-central-1"
    profile        = "private"
  }
}
