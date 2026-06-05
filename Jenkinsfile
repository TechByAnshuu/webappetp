pipeline {
    agent any

    environment {
        DOCKER_USER = "techansh14"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Frontend Image') {
            steps {
                bat 'docker build -t %DOCKER_USER%/webappetp-frontend:v1 frontend'
            }
        }

        stage('Build MySQL Image') {
            steps {
                bat 'docker build -t %DOCKER_USER%/webappetp-mysql:v1 mysql'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    bat 'docker login -u %DOCKER_USERNAME% -p %DOCKER_PASSWORD%'
                }
            }
        }

        stage('Push Frontend Image') {
            steps {
                bat 'docker push %DOCKER_USER%/webappetp-frontend:v1'
            }
        }

        stage('Push MySQL Image') {
            steps {
                bat 'docker push %DOCKER_USER%/webappetp-mysql:v1'
            }
        }
    }

    post {
        success {
            echo 'Images pushed successfully'
        }

        failure {
            echo 'Pipeline failed'
        }
    }
}