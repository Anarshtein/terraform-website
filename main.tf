terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "=5.43.0"
    }
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
provider "aws" {
  region = "eu-north-1"
}



resource "aws_security_group" "sec_gr_terra" {
  name = "security_gr_terra_task"
  description = "Created for Terraform task"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "terr-task" {
  ami=data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [ resource.aws_security_group.sec_gr_terra.id ]
  user_data = local.user_data
  key_name = "anar-terr"


}