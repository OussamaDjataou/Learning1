pipeline {
    agent { 
        node {
            label 'Docker-agent-alpine'
        }
    }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                apk update
                apk add docker docker-compose
                rc-update add docker default
                /etc/init.d/docker start
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                cd DOCKER
                python3 main.py
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                cd DOCKER
                # Build Docker image
                docker build -t oussamadjataou/test:latest -f Dockerfile .
                # Push Docker image to DockerHub
                docker push oussamadjataou/test:latest
                '''
            }
        }
    }
}
