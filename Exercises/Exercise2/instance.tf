resource "aws_instance" "intro-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "intro-key"
  vpc_security_group_ids = ["sg-0780815f55104be8a"]
  tags = {
    Name    = "Into-Instance"
    Project = "Agri"
  }
}