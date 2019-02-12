pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        git branch: 'master', url: 'https://github.com/thipparedi/warrepo1.git'
      }
    }
    stage ('build') {
      steps {
        sh 'mvn clean package'
   }
}
  }
}
