# Deploy application from Jenkins Pipeline to EC2 Instance (automatically with Docker)

The goal of this project is deployment of containerized web application on AWS EC2 instance using Jenkins.

Technologies used: 
- `AWS`
- `Docker`
- `Linux`
- `Jenkins`
- `Git`
- `Java`
- `Maven`
- `DockerHub`
 
Project description:
- Prepare `AWS EC2 Instance` for deployment (install `Docker`)
- Create `ssh key credentials` for `EC2 server` on `Jenkins`
- Extend the previous CI pipeline with deploy step to ssh into the remote `EC2 instance` and deploy newly built image 
from `Jenkins server`
- Configure security group on `EC2 instance` to allow access to our web application