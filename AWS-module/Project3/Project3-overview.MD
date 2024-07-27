# Deploy application from Jenkins Pipeline on EC2 instance

The goal of this project is deployment of multi container web application on AWS EC2 instance using Jenkins and Docker 
compose.

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
- Install `Docker compose` on `AWS EC2 instance`
- Create `docker-compose.yml` file that deploys our web application image
- Configure `Jenkins pipeline` to deploy newly build image using `Docker Compose` on `EC2 server`
- Improvement: Extract multiple `Linux commands` that are executed on remote server into separate `shell script` and 
execute the script from `Jenkinsfile`