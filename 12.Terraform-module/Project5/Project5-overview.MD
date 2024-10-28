# Complete CI/CD with Terraform

The goal of this project is to automate AWS infrastructure
- `Terraform`
- `Jenkins`
- `AWS`
- `Docker`
- `Docker Hub`
- `Java`
- `Maven`
- `Linux`
- `Git`
 
Project description:
- Integrate provisioning stage into complete CI/CD Pipeline to automate provisioning server instead of deploying to an existing server
- Create SSH Key Pair
- Install `Terraform` inside Jenkins container
- Add `Terraform` configuration to application’s `git` repository
- Adjust `Jenkinsfile` to add “provision” step to the CI/CD pipeline that provisions `EC2 instance`
- So the complete CI/CD project we build has the following configuration:
  CI step: Build artifact for `Java` `Maven` application.
  CI step: Build and push `Docker image` to `Docker Hub`.
  CD step: Automatically provision `EC2 instance` using `TF`.
  CD step: Deploy new application version on the provisioned `EC2 instance` with `Docker Compose`