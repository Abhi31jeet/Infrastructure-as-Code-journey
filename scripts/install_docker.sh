#!/bin/bash
# 1. Update the system packages
yum update -y

# 2. Install the Docker engine
yum install -y docker

# 3. Start the Docker service and ensure it starts on reboot
systemctl start docker
systemctl enable docker

# 4. Authenticate Docker to your private AWS ECR registry
# This uses the IAM Role we attached to the instance to get a temporary password
aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com

# 5. Pull and run your specific container image from ECR
# -d: run in background | -p 80:80: map host port 80 to container port 80
docker run -d -p 80:80 ${var.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/sre-journey-repo:v1