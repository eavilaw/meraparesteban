resource "aws_ecr_repository" "fastapi_repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"

  lifecycle {
    prevent_destroy = false
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = var.ecr_repo_name
    Environment = "dev"
  }
}