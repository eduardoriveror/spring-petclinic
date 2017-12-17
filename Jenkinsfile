pipeline {
    agent {
        docker { 
        	image 'maven:3.5.2-jdk-7' 
        }
    }

stages {
        stage('build') {
            steps {
                sh 'mvn clean && mvn compile && mvn package'
            }
        }
    }
}
