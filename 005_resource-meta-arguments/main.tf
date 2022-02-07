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
  alias = "east"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "AgriReach"
#   depends_on = [
#     aws_instance.my_server
#   ]
}


resource "aws_instance" "my_server" {
  provider = aws.east
  # count = 2
  for_each = {
      nano = "t2.nano"
      micro = "t2.micro"
      small = "t2.small"
  }
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = each.value
  tags = {
      Name = "Server-${each.key}"
  }
#   tags = {
#       Name = "Server-${count.index}"
#   }
#   depends_on = [
#     aws_s3_bucket.bucket
#   ]
}

# outputting required values in console
output "instance_ip_addr" {
  #value = aws_instance.my_server.public_ip
  #value = aws_instance.my_server[1].public_ip
  value = values(aws_instance.my_server)[*].public_ip
}