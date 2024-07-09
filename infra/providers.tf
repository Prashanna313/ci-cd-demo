terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Application = var.app
      CostCenter  = var.cost_center
      Environment = var.environment
    }
  }

  region = var.region
}