pipeline {
    agent any

    environment {
        IMAGE_NAME = "tylernyan03/finead-todo-app:latest"
    }

    stages {

        stage('Build') {
            steps {
                dir('TODO/todo_backend') {
                    sh 'npm install'
                }
                dir('TODO/todo_frontend') {
                    sh 'npm install'
                }
            }
        }

        stage('Containerise') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $IMAGE_NAME
                    '''
                }
            }
        }

    }
}