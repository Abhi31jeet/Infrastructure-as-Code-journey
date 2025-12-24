variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "project_name" {
  type        = string
  default     = "Infrastructure-as-Code-journey" # This is the VALUE
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}