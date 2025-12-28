#terraform {
#  backend "s3" {
#    bucket       = "abhijeet-terraform-state-2025"
#    key          = "dev/terraform.tfstate"
#    region       = "us-east-1"
#    # Replacing dynamodb_table with the new recommended locking
#    use_lockfile = true 
#  }
#}

terraform {
  backend "local" {}
}