pipeline {
    agent any 
    stages
    {
        stage('checkout')
        { 
            steps
            {
                script
                {
                 git 'https://github.com/thippreddy/warrepo.git'
                }
            }
        }
        stage('Build') 
        { 
            steps
            {
                  script
                  {
                        withSonarQubeEnv('SonarQube') 
                        {
                            sh label: '', script: 'mvn clean package'
                        }
                   }
            }
        }
        stage ('Junit') 
        {
            steps 
            {
                script
                {
                   junit 'target/surefire-reports/*.xml'
                }
            }
       }
      stage ('s3 deploy') 
      {
      
             steps
             {
                 script
                 {
                  s3Upload consoleLogLevel: 'INFO', dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'cloudassessment123', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-west-2', showDirectlyInBrowser: false, sourceFile: '**/*.xml', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'SUCCESS', profileName: 'Ravi', userMetadata: []
                 
                 }
       
post
    {
         success
        {
            script
            {
                if (isMaster)

                {
                    mail to: 'ravikumarthippareddy.12@gmail.com',
                     subject: "Build + Condition Pass",
                     body: "Build got success check status @ ${env.BUILD_URL}"
                 }
                 else
                 {
                     mail to: 'ravikumarthippareddy.12@gmail.com',
                     subject: "Build Pass + Condition Fail",
                     body: "Build got success check status @ ${env.BUILD_URL}"
                 }
            }
        }
           failure
        {
                script
            {
                if (isMaster)
                {
                    mail to: 'ravikumarthippareddy.12@gmail.com',
                     subject: "Build fail + Condition Pass",
                     body: "Build got success check status @ ${env.BUILD_URL}"
                 }
                 else
                 {
                     mail to: 'ravikumarthippareddy.12@gmail.com',
                     subject: "Build + Condition Fail",
                     body: "Build got success check status @ ${env.BUILD_URL}"
                 }
            }
        }
      }
      }
      
   }
    }
}







