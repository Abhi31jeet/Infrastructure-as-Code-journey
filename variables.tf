variable "aws_region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Terraform_S3_AbhijeetG"
  type        = string
}

variable "project_name" {
  description = "_AC_Terraform"
  type        = string
  default     = "Infrastructure-as-Code-journey"
}