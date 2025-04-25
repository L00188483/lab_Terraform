resource "aws_instance" "jumpbox" {
  ami           = var.image_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet1.id
  security_groups = [aws_security_group.public_sg.id]
  key_name = var.ssh_key_pair

  associate_public_ip_address = true

  tags = {
    Name = "jumpbox"
  }
}


resource "aws_instance" "private" {
  ami           = var.image_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet1.id
  security_groups = [aws_security_group.private_sg.id]
  key_name = var.ssh_key_pair

  tags = {
    Name = "private-instance"
  }
}
