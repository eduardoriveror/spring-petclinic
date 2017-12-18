pipeline {
    agent any
    environment {
        PROJECTNAME = 'javaapp'
    }
stages {
        stage('build') {
            agent {
                docker {
                    image 'java:8-jdk'
                }
            }
            steps {
                sh 'cd spring-petclinic && sh mvnw spring-boot:run' 
            }
        }
        
//        stage('Deploy') {
//            agent any
//            steps {
//                sh 'docker-compose -p ${PROJECTNAME} up -d'
//            }    
//        }
    }
}