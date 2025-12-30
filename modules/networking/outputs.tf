output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  # This returns a map of names to IDs for all subnets created by for_each
  value = { for k, v in aws_subnet.public : k => v.id }
}