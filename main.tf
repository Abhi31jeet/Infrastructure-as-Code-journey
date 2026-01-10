module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
  vpc_cidr     = "10.0.0.0/16"
  ami_id       = var.ami_id
  region       = var.region
}

module "monitoring" {
  source        = "./modules/monitoring"
  project_name  = var.project_name
  as_group_name = module.networking.asg_name
  email_address = "your-email@example.com" # Replace this!
}