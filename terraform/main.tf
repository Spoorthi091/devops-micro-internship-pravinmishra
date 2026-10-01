resource "aws_s3_bucket" "project_artifacts" {
  bucket_prefix = "${var.project_name}-${var.environment}-"

  tags = {
    Name        = "${var.project_name}-${var.environment}-artifacts"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_s3_bucket_public_access_block" "project_artifacts" {
  bucket = aws_s3_bucket.project_artifacts.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "project_artifacts" {
  bucket = aws_s3_bucket.project_artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "project_artifacts" {
  bucket = aws_s3_bucket.project_artifacts.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}