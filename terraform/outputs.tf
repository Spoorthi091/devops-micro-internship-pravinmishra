output "project_name" {
  description = "Configured project name."
  value       = var.project_name
}

output "aws_region" {
  description = "AWS region used by the provider."
  value       = var.aws_region
}

output "artifacts_bucket_id" {
  description = "ID of the S3 bucket created for project artifacts."
  value       = aws_s3_bucket.project_artifacts.id
}

output "artifacts_bucket_arn" {
  description = "ARN of the S3 bucket created for project artifacts."
  value       = aws_s3_bucket.project_artifacts.arn
}