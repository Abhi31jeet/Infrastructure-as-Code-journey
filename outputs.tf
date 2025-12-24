output "bucket_arn" {
  value       = aws_s3_bucket.portfolio_bucket.arn
  description = "The ARN of the S3 bucket"
}