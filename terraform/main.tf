terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "environment" {
  default = "production"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "instance_type" {
  default = "t3.medium"
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  environment = var.environment
}

module "eks" {
  source = "./modules/eks"
  cluster_name = "observability-${var.environment}"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  instance_type = var.instance_type
  environment = var.environment
}

output "eks_endpoint" {
  value = module.eks.endpoint
}

output "vpc_id" {
  value = module.vpc.vpc_id
}