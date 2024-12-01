provider "aws" {
  region     = "eu-central-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

#resource "aws_instance" "env0_instance" {
#  ami = "ami-017095afb82994ac7"
#  instance_type = "t2.micro"
#
#  tags = {
#    Environment = "Production"
#  }
#  subnet_id = ""
#}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "env0-terraform-state-bucket"
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name        = "Terraform State Bucket"
  }
}

#resource "aws_s3_bucket" "ce-test-terraform-state-bucket" {
##  force_destroy = true
#}

#
#resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
#  bucket = aws_s3_bucket.terraform_state.id
#  versioning_configuration {
#    status = "Enabled"
#  }
#}
#
#resource "aws_kms_key" "state_bucket_key" {
#  description             = "This key is used to encrypt bucket objects"
#  deletion_window_in_days = 10
#}
#
#resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket_encryption" {
#  bucket = aws_s3_bucket.terraform_state.id
#  rule {
#    apply_server_side_encryption_by_default {
#      kms_master_key_id = aws_kms_key.state_bucket_key.arn
#      sse_algorithm     = "aws:kms"
#    }
#  }
#}

#resource "aws_dynamodb_table" "terraform_locks" {
#  name           = "terraform-locks"
#  billing_mode   = "PAY_PER_REQUEST"
#  hash_key       = "LockID"
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#
#  tags = {
#    Name        = "Terraform Lock Table"
#  }
#}

# Terraform backend configuration using the testing state bucket
terraform {
  backend "s3" {
    bucket         = "ce-test-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}


#module "vpc" {
#  source = "terraform-aws-modules/vpc/aws"
#
#  name                 = "my-vpc"
#  cidr                 = "10.0.0.0/16"
#  azs                  = ["us-west-1a", "us-west-1b"]
#  public_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
#  private_subnets      = ["10.0.3.0/24", "10.0.4.0/24"]
#  enable_nat_gateway   = true
#  enable_dns_hostnames = true
#}


