pipeline {
    agent {
        docker { 
        	image 'maven:3.5.2-jdk-7' 
        }
    }

stages {
        stage('build') {
            steps {
                sh 'cd spring-petclinic && mvn clean && mvn compile && mvn package'
            }
        }
    }
}
