variable "aws_region" {
  description = "The AWS region to deploy in"
  default     = "us-east-1"
}

variable "account_id" {
  description = "Your 12-digit AWS Account ID"
  type        = string
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-0440d3b780d96b29d" # Amazon Linux 2023
}