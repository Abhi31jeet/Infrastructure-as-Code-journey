variable "project_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
  default     = "ami-0c101f26f147fa7fd" # Amazon Linux 2023 in us-east-1
}