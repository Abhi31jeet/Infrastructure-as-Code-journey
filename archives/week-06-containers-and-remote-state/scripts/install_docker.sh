#!/bin/bash
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker

# REMOVE "var." from these two lines:
aws ecr get-login-password --region ${aws_region} | docker login --username AWS --password-stdin ${account_id}.dkr.ecr.${aws_region}.amazonaws.com

docker run -d -p 80:80 ${account_id}.dkr.ecr.${aws_region}.amazonaws.com/sre-journey-repo:v1

