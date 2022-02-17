resource "aws_key_pair" "intro-key" {
  key_name   = "introkey"
  public_key = file("introkey.pub")
}

resource "aws_instance" "intro-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.intro-key.key_name
  vpc_security_group_ids = ["sg-0780815f55104be8a"]
  tags = {
    Name    = "Intro-Instance"
    Project = "Intro"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("introkey")
    host        = self.public_ip
  }
}

