provider "aws" {
  region = "ap-southeast-2"
}

data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS 8.* x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["125523088429"] 
}

resource "aws_instance" "centos-1" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"

  associate_public_ip_address = true
  key_name = "cgascoig-mac"

  tags = {
    Name = "centos-1"
  }
}
