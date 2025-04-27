terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.95.0"
    }
  }
}

provider "aws" {
  region = var.region
}


resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}


resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "nat_eip"
  }
}

