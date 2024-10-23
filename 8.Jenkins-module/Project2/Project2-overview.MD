# Create a CI Pipeline with Jenkinsfile

The goal of this project is creating a different type of jobs on Jenkins - Freestyle, Pipeline and Multibranch Pipeline.

Technologies used: 
- `Jenkins`
- `Docker`
- `Git`
- `Linux`
- `Java`
- `Maven`
 
Project description:
- Install Build Tools in `Jenkins`
- Make `Docker` available on `Jenkins server`
- Create `Jenkins credentials` for a `git repository`
- Create different `Jenkins job` types for the `Java Maven project` with `Jenkinsfile` to:
  - Connect to the application's `git repository`
  - Build `Jar`
  - Build `Docker image`
  - Push to `private DockerHub repository`
