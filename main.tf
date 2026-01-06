terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Create an EC2 Instance
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type

  key_name = var.key_name
  security_groups = [
    aws_security_group.allow_ssh_and_http.name
  ]

  tags = {
    Name        = "${var.server}-${var.environment}"
    Type        = var.demo
    Environment = var.environment
    Owner       = var.owner

  }

  user_data = templatefile("${path.module}/user_data.sh", {
    environment   = var.environment
    region        = var.region
    instance_type = var.instance_type
  })
}


# Get AMI ID
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

# Create a Security Group to allow SSH and HTTP traffic
resource "aws_security_group" "allow_ssh_and_http" {
  name = "allow_ssh_and_http-${var.environment}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTPS from anywhere (for demonstration purposes, restrict this in production)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere (for demonstration purposes, restrict this in production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }

}
