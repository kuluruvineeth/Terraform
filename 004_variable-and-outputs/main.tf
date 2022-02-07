terraform {
  
}

module "aws_server" {
    source = ".//submodule"
    instance_type = "t2.micro"
}
# outputting required values in console
output "instance_ip_addr" {
  value = module.aws_server.public_ip
}