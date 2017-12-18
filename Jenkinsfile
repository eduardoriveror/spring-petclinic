pipeline {
    agent any
    environment {
        PROJECTNAME = 'javaapp'
    }
stages {
        stage('build') {
            agent {
                docker {
                    image 'maven:3.5.2-jdk-8'
                }
            }
            steps {
                sh 'mvn clean && mvn compile war:war' // https://maven.apache.org/plugins/maven-war-plugin/usage.html
            }
        }
        stage('Deploy') {
            agent any
            steps {
                sh 'docker-compose -p ${PROJECTNAME} up -d'
            }    
        }
    }
}