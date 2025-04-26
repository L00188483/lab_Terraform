resource "aws_security_group" "alb_sg" {
  name   = "alb_sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "alb-sg"
  }
}


resource "aws_vpc_security_group_ingress_rule" "alb_sg_allow_http" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "alb_egress_all" {
  security_group_id = aws_security_group.alb_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}


resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "public_sg"
  }
}





resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "private_sg_allow_http_from_alb" {
  security_group_id = aws_security_group.private_sg.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  referenced_security_group_id = aws_security_group.alb_sg.id
}


# not necessary, useful for debugging
resource "aws_vpc_security_group_ingress_rule" "private_sg_allow_http_from_jumpbox" {
  security_group_id = aws_security_group.private_sg.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  referenced_security_group_id = aws_security_group.public_sg.id
}

resource "aws_vpc_security_group_ingress_rule" "private_sg_allow_ssh" {
  security_group_id = aws_security_group.private_sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  referenced_security_group_id = aws_security_group.public_sg.id
}

resource "aws_vpc_security_group_egress_rule" "private_egress_all" {
  security_group_id = aws_security_group.private_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}



###############################
# SGs for Jumpox
##############################

resource "aws_vpc_security_group_ingress_rule" "public_sg_allow_ssh" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}


resource "aws_vpc_security_group_egress_rule" "public_egress_all" {
  security_group_id = aws_security_group.public_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}