
resource "aws_eip" "jumpbox_eip" {
  domain = "vpc"

  tags = {
    Name = "jumpbox_eip"
  }
}

resource "aws_eip_association" "jumpbox_eip_assoc" {
  allocation_id        = aws_eip.jumpbox_eip.id
  network_interface_id = aws_network_interface.jumpbox_eni.id
}


# note: creating instance ENIs separately seems to prevent terraform replacing SGs unnecessarily
resource "aws_network_interface" "jumpbox_eni" {
  subnet_id       = aws_subnet.public_subnet1.id
  security_groups = [aws_security_group.public_sg.id]
}


resource "aws_instance" "jumpbox" {
  ami           = var.image_id
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.jumpbox_eni.id
    device_index         = 0
  }
  key_name = var.ssh_key_pair

  tags = {
    Name = "tf-jumpbox"
  }
}