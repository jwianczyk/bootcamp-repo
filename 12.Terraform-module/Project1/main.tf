provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = {
    Name: "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "myapp-subnet-1" {
  vpc_id            = aws_vpc.myapp-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags              = {
    Name: "${var.env_prefix}-subnet-1"
  }
}

resource "aws_internet_gateway" "myapp-internet-gateway" {
  vpc_id = aws_vpc.myapp-vpc.id
  tags   = {
    Name: "${var.env_prefix}-internet-gateway"
  }
}

resource "aws_default_route_table" "myapp-main-route-table" {
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-internet-gateway.id
  }
  tags = {
    Name: "${var.env_prefix}-main-route-table"
  }
}

resource "aws_default_security_group" "myapp-default-security-group" {
  vpc_id = aws_vpc.myapp-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = [var.my_cidr_block]
    description = "Port for SSH connection"
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Port for NGINX connection"
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
    description     = "Port for fetching Docker image"
  }
  tags = {
    Name: "${var.env_prefix}-default-security-group"
  }
}

resource "aws_instance" "myapp-server" {
  ami                         = data.aws_ami.lts-amazon-linux-image.id
  instance_type               = var.instance_type

  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.myapp-default-security-group.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key-pair.key_name

  user_data                   = file("entry-script.sh")
  user_data_replace_on_change = true

  tags = {
    Name: "${var.env_prefix}-server"
  }
}

resource "aws_key_pair" "ssh-key-pair" {
  key_name   = "server-key"
  public_key = file(var.public_key_path)
}

data "aws_ami" "lts-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel*x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output aws_ami_id {
  value = aws_instance.myapp-server.ami
}

output ec2_public_ip {
  value = aws_instance.myapp-server.public_ip
}

variable public_key_path {
  type = string
}

variable instance_type {
  type = string
}

variable vpc_cidr_block {
  type = string
}

variable subnet_cidr_block {
  type = string
}

variable availability_zone {
  type = string
}

variable env_prefix {
  type = string
}

variable my_cidr_block {
  type = string
}