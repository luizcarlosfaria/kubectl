pipeline {
    
    agent none

    stages {
      
        stage('Build') {

            agent any

            steps {
                
                echo sh(script: 'env|sort', returnStdout: true)

                sh  '''

                    docker build . -t registry.oragon.io/services/kubectl:${BRANCH_NAME:-master}
               
                '''

            }

        }

        stage('Publish') {

            agent any

            when { buildingTag() }


            steps {
                
                sh  '''

                    docker tag registry.oragon.io/services/kubectl:${BRANCH_NAME:-master} registry.oragon.io/services/kubectl:latest

                    docker push registry.oragon.io/services/kubectl:${BRANCH_NAME:-master} 
                    
                    docker push registry.oragon.io/services/kubectl:latest
               
                '''
            }

        }

 
    }
    post {

        always {
            node('master'){
                
                sh  '''
               
                '''
            }
        }
    }
}