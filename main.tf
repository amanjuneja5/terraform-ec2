provider "aws" {
  region = var.region  # Set your desired region
}

data "aws_ami" "default" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]  # Filter to get Amazon Linux 2 AMIs
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}


resource "aws_instance" "ec2" {
    ami           = data.aws_ami.default.id
    instance_type = var.instance_type
    tags = {
    Name = var.instance_name
  }
}

variable "region" {
    type = string
    description = "AWS region"
}

variable "instance_type" {
    type = string
    description = "instance type to be created"
}

variable "instance_name" {
    type = string
    description = "Instance name tag"
}
