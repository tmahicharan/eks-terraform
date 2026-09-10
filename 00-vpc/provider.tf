terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.55.0"
    }
  }


  backend "s3" {
    bucket = "mahi-remotestate"
    key    = "roboshop-eks-vpc"
    region = "us-east-1"
    encrypt= true
    use_lockfile= true
  }
}


provider "aws" {
  # Configuration options
  region= "us-east-1"
}