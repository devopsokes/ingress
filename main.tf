terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.15.1"
    }
  }
}
provider "aws" {
  region  = var.region
  profile = var.profile
}
locals {
  ami           = var.ami
  instance_type = var.instance_type
}
resource "aws_instance" "my_server" {
  ami           = local.ami
  instance_type = local.instance_type
}
output "public_ip" {
  value = aws_instance.my_server.public_ip
}