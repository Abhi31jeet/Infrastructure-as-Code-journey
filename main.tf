provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "docker_sg" {
  name        = "terraform-docker-sg"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "ecr_role" {
  name = "terraform-ecr-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_attach" {
  role       = aws_iam_role.ecr_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "ecr_profile" {
  name = "terraform-ecr-profile"
  role = aws_iam_role.ecr_role.name
}

resource "aws_instance" "web_server" {
  ami                    = "ami-0440d3b780d96b29d"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.docker_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ecr_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 165286508924.dkr.ecr.us-east-1.amazonaws.com
              docker run -d -p 80:80 165286508924.dkr.ecr.us-east-1.amazonaws.com/sre-journey-repo:v1
              EOF

  tags = {
    Name = "Terraform-Docker-Instance"
  }
}
