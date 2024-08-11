# Complete CI/CD Pipeline with EKS and AWS ECR

The goal of this project is deployment of full CI/CD pipeline with AWS EKS and AWS ECR
- `Kubernetes`
- `Jenkins`
- `AWS EKS`
- `AWS ECR`
- `Linux`
- `Docker`
- `Java`
- `Maven`
- `Git`
 
Project description:
- Create private AWS ECR Docker repository 
- Adjust Jenkins file to build and push Docker Image to AWS ECR 
- Integrate deploying to K8s cluster in the CI/CD pipeline from AWS ECR private registry 
- So the complete CI/CD project we build has the following configuration:
  - CI step: Increment version 
  - CI step: Build artifact for Java Maven application 
  - CI step: Build and push Docker image to AWS ECR 
  - CD step: Deploy new application version to EKS cluster 
  - CD step: Commit the version update