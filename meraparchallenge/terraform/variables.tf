variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "fastapi-desafio"
}

variable "ecr_repo_name" {
  default = "fastapi-dynamic"
}

variable "vpc_id" {
  description = "VPC ID where ECS will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnets for ECS and ALB"
  type        = list(string)
}