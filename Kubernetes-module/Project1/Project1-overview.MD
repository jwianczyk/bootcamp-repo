# Deploy MongoDB and Mongo Express into local K8s cluster

The goal of this project is to deploy a MongoDB database with Mongo Express in the `Minikube` local cluster.
Technologies used: 
- `MongoDB`
- `Mongo Express`
- `Kubernetes`
- `Docker`
 
Project description:
- Setup local K8s cluster with Minikube
- Deploy MongoDB and MongoExpress with configuration and credentials extracted into `ConfigMap` and `Secret`

Project flow is displayed in the diagram below
```mermaid
sequenceDiagram
Application UI: Mongo Express External Service ->> mongo-express: Mongo DB internal service ->> mongo-db
```
