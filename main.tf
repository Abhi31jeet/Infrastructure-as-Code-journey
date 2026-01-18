provider "aws" {
    region = var.aws_region
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
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.docker_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ecr_profile.name

  # This uses the templatefile function to pass variables into your shell script
  user_data = templatefile("\${path.module}/scripts/install_docker.sh", {
    aws_region = var.aws_region
    account_id = var.account_id
  })

  tags = {
    Name = "Terraform-Docker-Instance"
  }
}
