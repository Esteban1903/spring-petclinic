pipeline {
    agent none

    stages {
        stage('Build with Maven') {
            agent {
                docker {
                    image 'maven:3.9.9-eclipse-temurin-25'
                    reuseNode true
                }
            }
            steps {
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
