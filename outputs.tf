
output "jumpbox_public_ip" {
  value       = aws_instance.jumpbox.public_ip
  description = "Public IP of the EC2 instance in the public subnet"
}

output "private_instance_ip" {
  value       = aws_instance.private.private_ip
}


output "load_balancer_dns" {
  value       = aws_lb.public_alb.dns_name
  description = "Public DNS of the Load Balancer"
}