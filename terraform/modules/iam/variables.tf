variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment, such as dev or prod"
  type        = string
}

variable "secrets_manager_arn" {
  description = "ARN of the specific AWS Secrets Manager secret the role can access"
  type        = string
}
