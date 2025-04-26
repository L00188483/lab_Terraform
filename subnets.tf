resource "aws_subnet" "public_subnet1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr1
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr2
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr1
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet1"
  }
}