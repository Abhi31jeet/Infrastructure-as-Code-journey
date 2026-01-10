variable "project_name" {
  description = "Name of the project for resource naming"
  type        = string
}

variable "alert_email" {
  description = "The email address to receive SNS notifications"
  type        = string
}

variable "asg_name" {
} # Passed from networking module