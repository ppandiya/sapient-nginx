pipeline {
agent any

// Poll SCM for automated trigger - cron : every minute

triggers {
  pollSCM '* * * * *'
}

environment {
registry = "sriprasanna25/sapient-test"
registryCredential = 'docregistry'
}


stages {

// Build an docker dockerImage

      stage('Build') {
      steps {
      script {
      dockerImage = docker.build registry + ":$BUILD_NUMBER"
      latest = docker.build registry + ":latest"

      }

      }
      }

// Push docker image when branch is master
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
// Run Test stage when there is a changeRequest against master

      stage('Test') {
      when { changeRequest() }
      steps {
      script {
      if (env.CHANGE_TARGET == 'master') {
                        sh 'scripts/test.sh $BUILD_NUMBER'
                    }
      
      }

      }
      }

// Deploy to kubernetes cluster as a deployment objet - assuming kube config is available in local. if not configure the right agent.
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
