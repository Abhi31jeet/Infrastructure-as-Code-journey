variable "project_name" {
  description = "Name of the project to prefix resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# The "Senior" approach: Using a map for subnets
variable "public_subnets" {
  description = "A map of public subnets to create"
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "public-1" = { cidr = "10.0.1.0/24", az = "us-east-1a" }
    "public-2" = { cidr = "10.0.2.0/24", az = "us-east-1b" }
  }
}