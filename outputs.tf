output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  # Since we used for_each, we use a splat or loop to get the IDs
  value       = [for s in module.vpc.public_subnet_ids : s]
}