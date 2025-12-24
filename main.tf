resource "aws_s3_bucket" "portfolio_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "My Portfolio Bucket"
    Project     = var.Infrastructure-as-Code-journey
    Environment = "Dev"
  }
}