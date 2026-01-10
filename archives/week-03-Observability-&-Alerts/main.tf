module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
  vpc_cidr     = "10.0.0.0/16"
}

module "monitoring" {
  source       = "./modules/monitoring"
  project_name = var.project_name
  alert_email  = var.alert_email
  asg_name     = module.networking.asg_name # Connecting the modules!
}