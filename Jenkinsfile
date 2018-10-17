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

                }

               }
        }


	stage('Deploy')
  {
           when {
               allOf {
                   environment name: 'CHANGE_ID', value: ''
                   branch 'master'
               }
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


}
}
