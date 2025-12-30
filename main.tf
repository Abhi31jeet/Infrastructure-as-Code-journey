module "vpc" {
  source       = "./modules/networking"
  project_name = "sre-journey"
  vpc_cidr     = "10.0.0.0/16"

  # You can override the subnets here or leave the defaults
}