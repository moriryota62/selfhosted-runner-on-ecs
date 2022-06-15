terraform {
  required_version = ">= 1.0.10"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      pj    = "selfhosted"
      env   = "runner"
      owner = "mori"
    }
  }
}