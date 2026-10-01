variable "aws_region" {
  description = "AWS region where the infrastructure will be created."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used to identify project resources."
  type        = string
  default     = "devops-micro-internship"
}

variable "environment" {
  description = "Deployment environment name, such as dev, staging, or prod."
  type        = string
  default     = "dev"
}