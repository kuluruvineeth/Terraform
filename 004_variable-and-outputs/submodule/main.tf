terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}




provider "aws" {
  region = "us-east-1"
  access_key = "IAM user's access key"
  secret_key = "IAM user's secret key"
}

# dynamic variables
variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "The size of the ec2 instance"
  sensitive = false
  validation {
    condition = can(regex("^t3.",var.instance_type))
    error_message = "The instance must be a t3 type EC2 instance."
  }
}

resource "aws_instance" "my_server" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}

# outputting required values in console
output "instance_ip_addr" {
  value = aws_instance.my_server.public_ip
}