#module "eks" {
#  source  = "terraform-aws-modules/eks/aws"
#  version = "19.13.1"
#
#  cluster_name    = "test-eks"
#  cluster_version = "1.24"
#
#  vpc_id     = aws_vpc.main_vpc.id
#  subnet_ids = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
#  cluster_endpoint_public_access = true
#
#  eks_managed_node_group_defaults = {
#    ami_type = "AL2_x86_64"
#
#  }
#
#  eks_managed_node_groups = {
#    one = {
#      name = "node-group-1"
#
#      instance_types = ["t3.small"]
#
#      min_size     = 1
#      max_size     = 3
#      desired_size = 2
#    }
#
#    two = {
#      name = "node-group-2"
#
#      instance_types = ["t3.small"]
#
#      min_size     = 1
#      max_size     = 2
#      desired_size = 1
#    }
#  }
#}
#
#resource "aws_vpc" "main_vpc" {
#  cidr_block = "10.0.0.0/16"
#}
#
#resource "aws_subnet" "public_subnet_a" {
#  vpc_id            = aws_vpc.main_vpc.id
#  cidr_block        = "10.0.1.0/24"
#  availability_zone = "${var.region}-a"
#  map_public_ip_on_launch = true
#}
#
#resource "aws_subnet" "public_subnet_b" {
#  vpc_id            = aws_vpc.main_vpc.id
#  cidr_block        = "10.0.2.0/24"
#  availability_zone = "${var.region}-b"
#  map_public_ip_on_launch = true
#}
#
#
#provider "kubernetes" {
#  host                   = module.eks.cluster_endpoint
#  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
#}
#
#provider "aws" {
#  region = var.region
#}
#
#
#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 5.30"
#    }
#
#    random = {
#      source  = "hashicorp/random"
#      version = "~> 3.4.3"
#    }
#
#    tls = {
#      source  = "hashicorp/tls"
#      version = "~> 4.0.4"
#    }
#
#    cloudinit = {
#      source  = "hashicorp/cloudinit"
#      version = "~> 2.2.0"
#    }
#
#    kubernetes = {
#      source  = "hashicorp/kubernetes"
#      version = "~> 2.16.1"
#    }
#  }
#
#  required_version = "~> 1.3"
#}
#
#variable "region" {
#  description = "AWS region"
#  type        = string
#  default     = "us-east-2"
#}
#
