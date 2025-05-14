terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = var.region
}

terraform {
  backend "s3" {
    bucket         = "glps-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
