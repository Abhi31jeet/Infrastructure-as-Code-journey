output "asg_name" { value = aws_autoscaling_group.web_asg.name }
output "alb_dns" { value = aws_lb.main.dns_name }