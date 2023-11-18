terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.region
  profile = var.profile
}

terraform {
  backend "s3" {
    bucket  = "ex-backend-tf"
    key     = "vpc/QA/terraform.tfstate"
    dynamodb_table = "tf-state-locking"
    region  = "us-east-1"
    profile = "eX"
  }
}