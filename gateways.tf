resource "aws_internet_gateway" "internet_gateway1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet_gateway1"
  }
}

resource "aws_nat_gateway" "default" {
  subnet_id = aws_subnet.public_subnet1.id
  allocation_id = aws_eip.nat_eip.allocation_id
}
