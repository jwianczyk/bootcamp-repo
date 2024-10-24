# downloading correct java version for nexus
apt install openjdk-17-jre-headless

# downloading a nexus tar archive
wget https://download.sonatype.com/nexus/3/nexus-3.73.0-12-unix.tar.gz

# unpacking nexus from tar archive
tar -zxvf nexus-3.73.0-12-unix.tar.gz

# creating user for nexus service
adduser nexus

# adding full rights for both nexus directories
chown -R nexus:nexus nexus-3.72.0-04
chown -R nexus:nexus sonatype/work

# switching to nexus user
su - nexus

# starting nexus using binary
/opt/nexus-3.73.0-12/bin/nexus start

# checking if nexus started
ps aux | grep nexus

# Gradle build and publish commands
gradle build
gradle publish

# Maven build and publish commands
mvn package
mvn deploy
