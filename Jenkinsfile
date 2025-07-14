pipeline {
    agent any
    environment {
        DOCKER_CREDS = credentials('dockerhub-creds')
    }
    stages {
        stage('Clone Code') {
            steps {
                echo 'Code checkout successful'
            }
        }
        stage('Build Docker Image') {
            steps {
                dir('app') {
                    sh '''
                    docker build -t bharathi136/simple-node-app:latest .
                    '''
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push bharathi136/simple-node-app:latest
                    '''
                }
            }
        }
    }
}

