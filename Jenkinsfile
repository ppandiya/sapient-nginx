pipeline {
    agent any
 environment {
    registry = "sriprasanna25/sapient-test"
    registryCredential = 'docregistry'
  }
    stages {

        stage('Build') {
            steps {
                script {
                  docker.build registry + ":$BUILD_NUMBER"

                }            }
        }

    }
}

