
output "alb_dns" {
  description = "The DNS name of the Load Balancer"
  value       = module.networking.alb_dns
}

output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = module.networking.asg_name
}