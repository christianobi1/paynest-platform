output "vpc_id" {
  description = "ID of the development VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the development public subnet"
  value       = module.networking.public_subnet_id
}

output "internet_gateway_id" {
  description = "ID of the development internet gateway"
  value       = module.networking.internet_gateway_id
}

output "public_route_table_id" {
  description = "ID of the development public route table"
  value       = module.networking.public_route_table_id
}

output "iam_role_arn" {
  description = "ARN of the development EC2 IAM role"
  value       = module.iam.iam_role_arn
}

output "iam_instance_profile_name" {
  description = "Name of the development EC2 instance profile"
  value       = module.iam.iam_instance_profile_name
}

output "instance_id" {
  description = "ID of the development EC2 instance"
  value       = module.compute.instance_id
}

output "public_ip" {
  description = "Public IP address of the development EC2 instance"
  value       = module.compute.public_ip
}
