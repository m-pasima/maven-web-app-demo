pipeline {
    agent any

    tools {
        maven 'maven3.9.9'
    }

    stages {
        stage('Clone code') {
            steps {
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/m-pasima/maven-web-app-demo.git'
            }
        }
      
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('scan with sonarqube'){
            steps{
                sh 'mvn verify sonar:sonar'
            }
        }
         stage('Upload Build Artifacts'){
            steps{
                sh 'mvn deploy'
            }
        }
      
        stage('Deploy to tomcat'){
            steps{
                // Optional: Deploy only from main or staging, not dev!
                script {
                    if (env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'staging') {
                        deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcat-creds', path: '', url: 'http://18.134.158.50:8080')], contextPath: 'tesco', war: '**/*.war'
                    } else {
                        echo "Skipping deployment for dev branch"
                    }
                }
            }
        } 
        
    }
}
