pipeline {
    agent {
        docker { 
        	image 'maven:3.5.2-jdk-7' 
        }
    }

stages {
        stage('build') {
            steps {
                sh 'git clone git@github.com:eduardoriveror/spring-petclinic.git'
                sh 'cd spring-petclinic'
                sh 'mvn clean & mvn compile & mvn package'
            }
        }
    }
}