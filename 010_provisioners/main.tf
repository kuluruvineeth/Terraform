terraform {
  # storing state of terraform in cloud as backup for team
  /* cloud {
    organization = "kuluru"

    workspaces {
      name = "provisioners"
    }
  } */

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

# cloud provider
provider "aws" {
  region = "us-east-1"
}

# default vpc data
data "aws_vpc" "main" {
  id = "vpc-089172fd159354784"
}

# Security group
resource "aws_security_group" "sg_my_server" {
  name        = "sg_my_server"
  description = "MyServer Security Group"
  vpc_id      = data.aws_vpc.main.id

  ingress = [
    {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },

    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["157.48.70.66/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }

  ]


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }
}

# aws key pair to ssh into machine
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAACDWDoPU0ioyK8ygr7Eg+o7J+NkLopSeCMEuZqoqutr0kZSBdwTYl6Fik/H8bsXpmBSjONN2jQUlUAyDYH6t7T2znUtrAnUe2Z8cJqFKJhfRJEncw744LYXzgfzkDOg4xLr6+kWZOgBEBKA6n1HzxJfNyNMmDFWsquWgaKasnreHQxbe1EufQRnItBHl+R8CHx9JcArAXlHqq5uioIEiUtU5BLsgjSJNrMiEWVIi/Z8eLdL7Dn/piewd359Zo49/BUjiNzxkATqqfdIX7w0jZRmkTEKlkHGwPjRn4GaLYTpB+/hDYIXBHLOmo8xYHo8HCOqXknZOuyR0HjJDeMNATl5XG4jpARXDhd+5uDipDviUq7vLmvE6TkbxtLZfxGvPmPgMk5Gms6gSD6tnXtPRWdt0zQLJHJoJI655SK2ddr+RxkRiMtLo/u5KLdx2yrpusKnc7eqZWz4wkTxdnvz7rmmn9VTqFBygRQDOj7lEtQUA1TaE3BpQYRrd0erYHrs= kuluruvineeth@kuluruvineeth-HP-Laptop-15-da0xxx"
}

# user data httpd installing
data "template_file" "user_data" {
  template = file("./userdata.yaml")
}

# launching ec2 instance
resource "aws_instance" "my_server" {
  ami                    = "ami-0a8b4cd432b1c3063"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.sg_my_server.id]
  user_data              = data.template_file.user_data.rendered
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
  /*provisioner "remote-exec" {
    inline = [
      "echo ${self.private_ip} >> /home/ec2-user/private_ips.txt"
    ]

    connection {
      type = "ssh"
      user = "ec2-user"
      host = "${self.public_ip}"
      private_key = "${file("/home/kuluruvineeth/.ssh/terraform")}"
      
    }

  }*/

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/home/ec2-user/ami.txt"
    connection {
      type = "ssh"
      user = "ec2-user"
      host = "${self.public_ip}"
      private_key = "${file("/home/kuluruvineeth/.ssh/terraform")}"
      
    }
  }
  tags = {
    Name = "MyServer"
  }

}

resource "null_resource" "status" {
    provisioner "local-exec" {
        command = "aws ec2 wait instance-status-pok --instance-ids ${aws_instance.my_server.id}"
    
    }
    depends_on = [
      aws_instance.my_server
    ]
  
}

# Output variables
output "public_ip" {
  value = aws_instance.my_server.public_ip
}


