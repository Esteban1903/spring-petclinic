pipeline {
    agent none

    stages {
        stage('Build with Maven') {
            agent {
                docker {
                    image 'eclipse-temurin:25-jdk'
                    reuseNode true
                }
            }
            steps {
                sh 'apt-get update && apt-get install -y maven'
                sh 'mvn -version'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            agent any
            steps {
                sh 'docker build -t esteban1903/spring-petclinic:latest .'
            }
        }

        stage('Push Docker Image') {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push esteban1903/spring-petclinic:latest'
                }
            }
        }
    }
}
