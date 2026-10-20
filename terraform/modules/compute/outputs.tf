output "instance_id" {
  description = "ID of the PayNest EC2 instance"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "Public IP address of the PayNest EC2 instance"
  value       = aws_instance.app.public_ip
}

output "instance_arn" {
  description = "ARN of the PayNest EC2 instance"
  value       = aws_instance.app.arn
}
