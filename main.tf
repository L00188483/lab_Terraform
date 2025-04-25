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
}


output "jumpbox_public_ip" {
  value       = aws_instance.jumpbox.public_ip
  description = "Public IP of the EC2 instance in the public subnet"
}

output "private_instance_ip" {
  value       = aws_instance.private.private_ip
}
