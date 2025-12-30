variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# A Map to define multiple subnets dynamically
variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "pub-1" = { cidr = "10.0.1.0/24", az = "us-east-1a" }
    "pub-2" = { cidr = "10.0.2.0/24", az = "us-east-1b" }
  }
}