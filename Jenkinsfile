pipeline {
    agent {
        docker { 
        	image 'maven:3.5.2-jdk-8' 
        }
    }

stages {
        stage('build') {
            steps {
                sh 'mvn clean && mvn compile war:war' // https://maven.apache.org/plugins/maven-war-plugin/usage.html
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image 'tomcat:8.0.48'
                }
            }
            steps{
                sh 'echo "$TOMCAT_HOME" || echo "CATALINA_HOME"'
            }    
        }
    }
}
