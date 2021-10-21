terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "220588007703_SSO-Consumer-admin"
  access_key = var.access_key
  secret_key = var.secret_key
  token = var.token
  region  = "eu-west-1"
}
