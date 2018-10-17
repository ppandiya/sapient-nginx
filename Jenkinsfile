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
      dockerImage = docker.build registry + ":$BUILD_NUMBER"

      }

      }
      }

      stage('Deploy')
      {
      when {
      changeRequest target: 'master'

      }
      steps{
      script {
      docker.withRegistry('', registryCredential )
      {
      dockerImage.push()
      }
      }

      }
      }
      
      stage('Test') {
      when {
      branch 'master'

      }
      steps {
      script {
      sh 'scripts/test.sh'
      }

      }
      }

    }
}

