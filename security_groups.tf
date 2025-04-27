
resource "aws_security_group" "alb_sg" {
  name   = "alb_sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "alb-sg"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "private_sg" {
  name   = "private_sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private_sg"
  }

  ingress {
    from_port                   = 80
    to_port                     = 80
    protocol                    = "tcp"
    security_groups             = [aws_security_group.alb_sg.id]
    description                 = "Allow HTTP from ALB"
  }

  # not necessary, but useful for debugging
  ingress {
    from_port                   = 80
    to_port                     = 80
    protocol                    = "tcp"
    security_groups             = [aws_security_group.public_sg.id]
    description                 = "Allow HTTP from Jumpbox"
  }

  ingress {
    from_port                   = 22
    to_port                     = 22
    protocol                    = "tcp"
    security_groups             = [aws_security_group.public_sg.id]
    description                 = "Allow SSH from Jumpbox"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "public_sg" {
  name   = "public_sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public_sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}