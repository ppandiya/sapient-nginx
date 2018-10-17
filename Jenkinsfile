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
      dockerImage_L = docker tag registry+ ":$BUILD_NUMBER" registry+":latest"

      }

      }
      }

      stage('PublishImage')
      {

	when {
        branch 'master'

	}
      steps{
      script {
      docker.withRegistry('', registryCredential )
      {
      dockerImage.push()
      dockerImage_L.push()
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
      sh 'scripts/test.sh $BUILD_NUMBER'
      }

      }
      }
      stage('Deploy') {
      when {
      branch 'Production'

      }
      steps {
      script {

      sh 'kubectl apply -f scripts/sapient-deploy.yaml'
      }

      }
      }

    }
}
