pipeline {
agent any
triggers {
  pollSCM '* * * * *'
}

environment {
registry = "sriprasanna25/sapient-test"
registryCredential = 'docregistry'
}

stages {

      stage('Build') {
      steps {
      script {
      dockerImage = docker.build registry + ":$BUILD_NUMBER"
      latest = docker.build registry + ":latest"

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
      latest.push()
      }
      }

      }
      }

      stage('Test') {
      when {
              allOf {
                changeRequest target: 'master'
              }
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

