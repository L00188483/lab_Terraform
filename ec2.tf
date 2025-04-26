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
