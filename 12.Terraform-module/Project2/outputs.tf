output aws_ami_id {
  value = aws_instance.myapp-server.ami
}

output ec2_public_ip {
  value = aws_instance.myapp-server.public_ip
}
