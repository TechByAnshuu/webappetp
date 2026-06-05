pipeline {
agent any

```
environment {
    DOCKERHUB_USERNAME = "yourdockerhubusername"
    FRONTEND_IMAGE = "webappetp-frontend"
    MYSQL_IMAGE = "webappetp-mysql"
}

stages {

    stage('Checkout Source') {
        steps {
            checkout scm
        }
    }

    stage('Build Frontend Image') {
        steps {
            script {
                docker.build(
                    "${DOCKERHUB_USERNAME}/${FRONTEND_IMAGE}:${BUILD_NUMBER}",
                    "./frontend"
                )
            }
        }
    }

    stage('Build MySQL Image') {
        steps {
            script {
                docker.build(
                    "${DOCKERHUB_USERNAME}/${MYSQL_IMAGE}:${BUILD_NUMBER}",
                    "./mysql"
                )
            }
        }
    }

    stage('Docker Login') {
        steps {
            withCredentials([
                usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )
            ]) {
                sh '''
                echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                '''
            }
        }
    }

    stage('Push Frontend Image') {
        steps {
            sh '''
            docker push ${DOCKERHUB_USERNAME}/${FRONTEND_IMAGE}:${BUILD_NUMBER}
            '''
        }
    }

    stage('Push MySQL Image') {
        steps {
            sh '''
            docker push ${DOCKERHUB_USERNAME}/${MYSQL_IMAGE}:${BUILD_NUMBER}
            '''
        }
    }
}

post {
    success {
        echo 'Images successfully pushed to Docker Hub'
    }

    failure {
        echo 'Pipeline failed'
    }
}
```

}
