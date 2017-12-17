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
//            agent {
//                docker {
//                    image 'tomcat:8.0.48'
//                    args '-d'
//                }
//            }
            steps{
                sh 'docker-compose up -d'
//                sh 'systemctl start tomcat'
//                sh 'sleep 3m'
            }    
        }
    }
}
