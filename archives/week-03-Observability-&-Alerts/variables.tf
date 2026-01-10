variable "project_name" {
  type    = string
  default = "sre-journey-v3"
}

variable "alert_email" {
  type        = string
  description = "Your email for SNS alerts"
}
variable "ami_id" {
  default = "ami-0c101f26f147fa7fd"
} # Amazon Linux 2023 (us-east-1)