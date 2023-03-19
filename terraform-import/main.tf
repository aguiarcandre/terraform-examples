locals {
  aws_region        = "us-east-1"
  aws_profile       = "terraform-test"
  ec2_ami           = "ami-02f3f602d23f1659d" # Amazon Linux 2023
  ec2_instance_type = "t3.micro"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = local.aws_region
  profile = local.aws_profile
}

resource "aws_instance" "terraform_instance" {
  ami           = local.ec2_ami
  instance_type = local.ec2_instance_type

  tags = {
    Name = "CreatedByTerraform"
  }
}

resource "aws_instance" "clickops_instance" {
  ami           = "ami-02f3f602d23f1659d" # Fill with your AMI
  instance_type = "t2.micro" # Fill with your instance type

  tags = {
    Name = "CreatedManually"
  }
}

