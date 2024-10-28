def init(){
    echo 'Initializing repository'
    sh 'cd 08.Jenkins-module/Project2'
}

def buildJar() {
    echo 'building the application'
    sh 'mvn package'
}

def buildImage() {
    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        sh 'docker build -t lacroix0/bootcamp_repo:jma-2.0 .'
    }
}

def deployApp() {
    echo 'deploying the application'
    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]){
        sh 'echo $PASS | docker login -u $USER --password-stdin'
        sh 'docker push lacroix0/bootcamp_repo:jma-2.0'
    }
}

return this
