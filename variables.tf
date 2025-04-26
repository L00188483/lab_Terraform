variable "region" {
  type = string
  default = "eu-west-1"
}

# AZs are hard-coded here, to a list of AZs run:
#  $ aws ec2 describe-availability-zones --query "AvailabilityZones[*][ZoneName][0]" --region "eu-west-1"


variable "availability_zone1" {
  default = "eu-west-1a"
}

variable "availability_zone2" {
  default = "eu-west-1b"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr1" {
  type = string
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr2" {
  type = string
  default = "10.0.2.0/24"
}


variable "private_subnet_cidr1" {
  type = string
  default = "10.0.3.0/24"
}

# variable "availability_zone1" {
#   type = string
#   default = "eu-west-1a"
# }

variable "image_id" {
  type = string
  default = "ami-0ea0f26a6d50850c5"
}

variable "ssh_key_pair" {
  default = "firstEC2instancekeypair"
}
