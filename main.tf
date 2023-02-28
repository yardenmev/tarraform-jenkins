provider "aws" {
  region = var.provider_region
  default_tags {
    tags = {
      Owner           = "yarden"
      expiration_date = "30-02-23"
      bootcamp        = "int"
    }
  }
}
terraform {
  backend "s3"{
    bucket = "yarden-s3"
    key = "tfclass"
    region = "eu-west-1"
  }
}
resource "aws_instance" "yarden-ec2" {

  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.subnets, count.index).id
  associate_public_ip_address = true
  user_data                   = "${file("dockerscript.sh")}"
  count = var.ec2
  tags = {
    Name = "yarden-tf-${count.index +1}"
  }
}