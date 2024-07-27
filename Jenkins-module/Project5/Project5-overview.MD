# Dynamically increment application version in Jenkins Pipeline

The goal of this project is automatic incrementation of application version with every build using Jenkins.

Technologies used: 
- `Jenkins`
- `Docker`
- `Git`
- `GitHub`
- `Java`
- `Maven`
 
Project description:
- Configure CI step: Increment patch version
- Configure CI step: Build `Java` application and clean old artifacts
- Configure CI step: Build image with dynamic `Docker Image Tag`
- Configure CI step: Push image to private `DockerHub repository`
- Configure CI step: Commit version update of `Jenkins` back to `Git repository`
- Configure `Jenkins pipeline` to not trigger automatically on CI build commit to avoid commit loop
