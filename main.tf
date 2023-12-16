terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "ec2_instances" {
  count         = 10
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2_Instance_${count.index + 1}"
  }
}