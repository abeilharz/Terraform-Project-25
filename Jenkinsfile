pipeline {
  agent any

  environment 
    AWS_REGION = 'us-east-1'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/abeilharz/infraPro.git'
      }
    }

    stage('Build 1: Terraform init') {
      steps {
        withCredentials([
          string(credentialsId: 'aws-access-key-id',      variable: 'AWS_ACCESS_KEY_ID'),
          string(credentialsId: 'aws-secret-access-key',  variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh 'terraform init -input=false'
        }
      }
    }

    stage('Build 2: Terraform plan') {
      steps {
        withCredentials([
          string(credentialsId: 'aws-access-key-id',      variable: 'AWS_ACCESS_KEY_ID'),
          string(credentialsId: 'aws-secret-access-key',  variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh 'terraform plan -out=tfplan -input=false'
        }
      }
    }

    stage('Deploy: Terraform apply') {
      steps {
        withCredentials([
          string(credentialsId: 'aws-access-key-id',      variable: 'AWS_ACCESS_KEY_ID'),
          string(credentialsId: 'aws-secret-access-key',  variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh 'terraform apply -input=false -auto-approve tfplan'
        }
      }
    }

    stage('Unit Tests') {
      steps {
        echo 'TODO: add unit tests'
      }
    }

    stage('Integration Tests') {
      steps {
        echo 'TODO: add integration tests'
      }
    }
  }
}

