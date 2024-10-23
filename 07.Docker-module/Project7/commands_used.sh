# Updating package manager
apt update

# Downloading docker on server
snap install docker

# Checking if docker is properly installed
docker

# Creating volume for data persistance
docker volume create --name nexus-data

# Running nexus container in detached mode, with set ports, name and attached volume
docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3
