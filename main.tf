resource "aws_s3_bucket" "portfolio_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "My Portfolio Bucket"
    Project     = var.project_name  # Reference the NAME of the variable, not the value
    Environment = "Dev"
  }
}