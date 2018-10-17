pipeline {
    agent any
    environment {
        CI = 'true'
    }
    stages {

        stage('Build') {
            steps {
                script {
                  docker.build sriprasanna25 + ":$BUILD_NUMBER"

                }            }
        }

    }
}

