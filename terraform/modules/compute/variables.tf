variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment, such as dev or prod"
  type        = string
}

variable "ami_id" {
  description = "ID of the AWS machine image"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the instance will run"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the instance"
  type        = list(string)
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile"
  type        = string
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
}
