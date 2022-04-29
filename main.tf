provider "aws" {
  region = var.aws_region
}


#Create security group with firewall rules
resource "aws_security_group" "security_teste_port" {
  name        = "security_teste_port"
  description = "security group for test"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from test server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_teste_port"
  }
}

resource "aws_instance" "myFirstInstance" {
  ami           = "ami-0f9fc25dd2506cf6d"
  key_name = var.key_name
  instance_type = var.instance_type
  security_groups= [ "security_teste_port"]
  tags= {
    Name = "teste_instance"
  }
}

# Create Elastic IP address
resource "aws_eip" "myFirstInstance" {
  vpc      = true
  instance = aws_instance.myFirstInstance.id
tags= {
    Name = "teste_elastic_ip"
  }
}
