pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        git branch: 'dev1', url: 'https://github.com/cdpipeline/vetinary-care-solutions.git'
      }
    }
    stage ('build') {
      steps {
        sh 'mvn clean package'
   }
}
  }
}
