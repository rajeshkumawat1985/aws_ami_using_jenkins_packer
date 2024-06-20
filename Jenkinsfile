pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    disableConcurrentBuilds()
    ansiColor('xterm')
    timestamps()
    timeout(time: 20) 
  }
  agent any
    parameters {
        string(defaultValue: "AWS-AMI-With-Packer-Jenkins-Build", description: 'What AMI name you wish to keep?', name: 'AMI_NAME')
        choice(choices: ['us-west-2', 'us-east-1'], description: 'What AWS region?', name: 'REGION')
        string(defaultValue: "AWS AMI With Packer Jenkins Build", description: 'Please put some description about this AMI?', name: 'DESCRIPTION')
    }
  stages {
    stage('AWS AMI using Packer Jenkins Build') {
      steps {
          script {
          sh '''
           Build/execute.sh
          '''
      }
    }
   }
 }
}
