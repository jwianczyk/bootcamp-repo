# Complete CI/CD Pipeline with EKS and private DockerHub registry

The goal of this project is deployment of full CI/CD pipeline with EKS cluster and DockerHub
- `Kubernetes`
- `Jenkins`
- `AWS EKS`
- `Docker Hub`
- `Linux`
- `Docker`
- `Java`
- `Maven`
- `Git`
 
Project description:
- Write K8s manifest files for Deployment and Service configuration 
- Integrate deploy step in the CI/CD pipeline to deploy newly built application image from DockerHub private registry to the EKS cluster 
- So the complete CI/CD project we build has the following configuration:
  - CI step: Increment version
  - CI step: Build artifact for Java Maven application
  - CI step: Build and push Docker image to DockerHub 
  - CD step: Deploy new application version to EKS cluster
  - CD step: Commit the version update