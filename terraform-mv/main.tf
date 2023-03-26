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

# First resource
# resource "aws_instance" "terraform_instance" {
#   ami           = local.ec2_ami
#   instance_type = local.ec2_instance_type

#   tags = {
#     Name = "CreatedByTerraform"
#   }
# }

# Renamed resource
resource "aws_instance" "frontend" {
  ami           = local.ec2_ami
  instance_type = local.ec2_instance_type

  tags = {
    Name = "CreatedByTerraform"
  }
}