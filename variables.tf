variable "region" {
  type = string
  default = "eu-west-1"
}

variable "availability_zone" {
  default = "eu-west-1a"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr1" {
  type = string
  default = "10.0.1.0/24"
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
