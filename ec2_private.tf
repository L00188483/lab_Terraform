


resource "aws_network_interface" "private_eni" {
  subnet_id       = aws_subnet.private_subnet1.id
  security_groups = [aws_security_group.private_sg.id]

  tags = {
    Name = "private-eni"
  }
}

resource "aws_instance" "private" {
  ami           = var.image_id
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.private_eni.id
    device_index         = 0
  }
  key_name = var.ssh_key_pair
  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /var/www/html
              chmod -R 755 /var/www/html
              echo "Hello from EC2" > /var/www/html/index.html
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "private-instance"
  }
}
