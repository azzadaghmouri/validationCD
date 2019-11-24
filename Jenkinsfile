pipeline {

    agent any

    tools {

        // Note: this should match with the tool name configured in your jenkins instance (JENKINS_URL/configureTools/)

        maven "Maven"

    }
    
    environment {
        
    registry = "sunnychams/docker-spring"
    
    registryCredential = 'dockerhub'
    
    dockerImage = ''
    
    }
    stages {
        
        stage("clone code") {

            steps {

                script {

                    // Let's clone the source

                    git 'https://github.com/Chams91/cd-docker-spring-jenkins.git';

                }

            }

        }

        stage("clean") {

            steps {

                script {

                    // Let's clone the source

                    sh "mvn clean"

                }

            }
        }
        
        stage("mvn build package") {

            steps {

                script {

                    // If you are using Windows then you should use "bat" step

                    // Since unit testing is out of the scope we skip them

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
