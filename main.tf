provider "aws" {
  region = var.region
}

resource "aws_security_group" "jenkins_security" {
  name        = "jenkins_security"
  description = "jenkins_security"
  dynamic "ingress" {
    for_each = var.service_ports
    content {
      description      = "Port: ${ingress.value}"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "jenkins" {
  # ami                    = "ami-0b827f3319f7447c6"
  ami                    = "ami-0b1f6dadd6c912cca"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.jenkins_security.id]
  tags = {
    Name = "terraform-jenkins"
  }
  user_data = data.template_file.user_data.rendered
}

variable "service_ports" {
  default = [22, 8443, 80, 5000]
}
output "welcome_to_jenkins" {
  value = "http://${aws_instance.jenkins.public_ip}"
}
variable "region" {
  default = "ap-northeast-2"
}
variable "url" {}
variable "user" {}
variable "password" {}
data "template_file" "user_data" {
  template = file("install.sh")
  vars = {
    url = var.url
    user = var.user
    password = var.password
  }
}
