output "vpc_id" {
  description = "ID of the production VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the production public subnet"
  value       = module.networking.public_subnet_id
}

output "security_group_id" {
  description = "ID of the production application security group"
  value       = module.networking.security_group_id
}

output "iam_role_arn" {
  description = "ARN of the production EC2 IAM role"
  value       = module.iam.iam_role_arn
}

output "iam_instance_profile_name" {
  description = "Name of the production EC2 instance profile"
  value       = module.iam.iam_instance_profile_name
}

output "instance_id" {
  description = "ID of the production EC2 instance"
  value       = module.compute.instance_id
}

output "public_ip" {
  description = "Public IP address of the production EC2 instance"
  value       = module.compute.public_ip
}
