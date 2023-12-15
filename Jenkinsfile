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
                
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                python3 main.py
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                docker build -t oussamadjataou/test:latest -f Dockerfile .
                docker push oussamadjataou/test:latest
                '''
            }
        }
    }
}
