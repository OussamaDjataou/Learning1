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
                pip install -r requirements.txt
                curl -fsSL https://get.docker.com -o get-docker.sh
                sh get-docker.sh
                rm get-docker.sh
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
