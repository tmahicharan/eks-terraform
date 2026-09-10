terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.55.0"
    }
  }


  backend "s3" {
    bucket = "mahi-remotestate"
    key    = "ingress-alb"
    region = "us-east-1"
    encrypt= true
    use_lockfile= true
  }
}


provider "aws" {
  # Configuration options
  region= "us-east-1"
}