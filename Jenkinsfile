pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        git branch: 'master', url: 'https://github.com/sreehari112/jenkins.git'
      }
    }
    stage ('build') {
      steps {
        sh 'mvn clean package'
   }
}
  }
}
