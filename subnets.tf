resource "aws_subnet" "public_subnet1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr1
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet1"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr1
  availability_zone = var.availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet1"
  }
}