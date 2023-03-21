# Fundenmental Terraform block with version and providers
terraform {
  required_version = ">=1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myfirst_ec2_from_terraform" {
  ami               = "ami-0e38fa17744b2f6a5"
  availability_zone = "us-east-1e"
  instance_type     = "t2.micro"
  key_name          = "AUE1-WINDOWS-SERVER"
  count             = 2
  security_groups   = ["launch-wizard-1"]
  tags = {
    "Name" = "windows server-${count.index}"
  }
}