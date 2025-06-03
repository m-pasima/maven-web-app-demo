pipeline {
    agent any

    tools {
        maven 'maven3.9.9'
    }

    stages {
        stage('Clone code') {
            steps {
                git branch: 'main', url: 'https://github.com/m-pasima/maven-web-app-demo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Scan with SonarQube') {
            steps {
                sh 'mvn verify sonar:sonar'
            }
        }

        stage('Upload Build Artifacts') {
            steps {
                sh 'mvn deploy'
            }
        }

        stage('Manual Approval for Production') {
            steps {
                script {
                    input message: "Approve deployment to PRODUCTION?"
                }
            }
        }

        stage('Deploy to Production') {
            steps {
                deploy adapters: [tomcat9(
                    alternativeDeploymentContext: '',
                    credentialsId: 'tomcat-creds',
                    path: '',
                    url: 'http://18.175.61.25:8080/')
                ], contextPath: 'tesco', war: '**/*.war'
            }
        }
    }
}

