terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile    = "default"
  region     = "us-east-1"
  shared_credentials_file = "/home/catherine/Terraform/Capstone/creds"
} 


