variable "project_name" {}
variable "vpc_cidr" {}
variable "ami_id" {}
variable "region" {
  type        = string
  description = "The AWS region where resources are deployed"
  default     = "us-east-1"
}