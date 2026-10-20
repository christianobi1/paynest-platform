variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "paynest"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the development VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "ami_id" {
  description = "AMI ID for the development EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of an existing EC2 key pair"
  type        = string
}

variable "secrets_manager_arn" {
  description = "ARN of the PayNest secret in AWS Secrets Manager"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the development environment"
  type        = string
  default     = "t3.micro"
}
