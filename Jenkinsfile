pipeline {

    agent any

    tools {

        maven "maven"

    }
    
    environment {
        
    registry = "azzadaghmouri/reservation-service"
    
    registryCredential = 'docker'
    
    dockerImage = ''
    
    }
    stages {      
        stage("clean") {

            steps {

                script {

                    sh "mvn clean"

                }

            }
        }
        
        stage("mvn build package") {

            steps {

                script {

                    sh "mvn -B package -DskipTests=true"

                }

            }

        }
        
        stage('Building image') {
            
            steps{
        
                script {
                    
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                
                    
                }
            }
        }
        
        stage('Deploy Image') {
      
            steps{
        
                script {
          
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
    }
}
