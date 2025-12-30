# 1. The S3 Bucket for State Storage
resource "aws_s3_bucket" "terraform_state" {
  bucket = "abhijeet-terraform-state-site-2025" # Must be unique

  #lifecycle {
  #  prevent_destroy = true # Safety first!
  #}
}

# 2. The DynamoDB Table for Locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}