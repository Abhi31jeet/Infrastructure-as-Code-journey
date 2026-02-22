# 1. The S3 Bucket to store the state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "sre-journey-tf-state-${var.account_id}" # Must be globally unique
  
  # Prevent accidental deletion of this bucket
  lifecycle {
    prevent_destroy = true
  }
}

# 2. Enable versioning so we can roll back state if it gets corrupted
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 3. The DynamoDB Table for locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}