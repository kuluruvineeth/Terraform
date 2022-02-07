# terraform {
  
# }

# variable "hello" {
#   type = string
# }

# variable "worlds" {
#   type = list
# }

# variable "worlds_map" {
#   type = map
# }

# variable "worlds_splat" {

# }

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "default"
  region = "us-east-1"
}

# Define Ports as a list in locals block
locals {
  ports = [80, 443, 8080, 8081, 7080, 7081]
}

# Create Security Group using Terraform Dynamic Block
resource "aws_security_group" "sg-dynamic" {
  name = "dynamic-block-demo"
  description = "dynamic-block-demo"

  dynamic "ingress" {
    for_each = local.ports 
    content {
      description = "description ${ingress.key}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}