provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = {
    Name: "${var.env_prefix}-vpc"
  }
}

module "myapp-subnet" {
  source                 = "./modules/subnet"
  availability_zone      = var.availability_zone
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
  env_prefix             = var.env_prefix
  subnet_cidr_block      = var.subnet_cidr_block
  vpc_id                 = aws_vpc.myapp-vpc.id
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

  subnet_id                   = module.myapp-subnet.subnet.id
  vpc_security_group_ids      = [aws_default_security_group.myapp-default-security-group.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key-pair.key_name
  availability_zone           = var.availability_zone

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