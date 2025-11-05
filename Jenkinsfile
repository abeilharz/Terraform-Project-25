pipeline {
  agent any

  environment {
    AWS_REGION = 'us-east-1'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/abeilharz/Terraform-Project-25.git'
      }
    }

    stage('Build 1: Terraform init') {
      steps {
        withCredentials([
          usernamePassword(
            credentialsId: 'aws-terraform',
            usernameVariable: 'AWS_ACCESS_KEY_ID',
            passwordVariable: 'AWS_SECRET_ACCESS_KEY'
          )
        ]) {
          sh 'terraform init -input=false'
        }
      }
    }

    stage('Build 2: Terraform plan') {
      steps {
        withCredentials([
          usernamePassword(
            credentialsId: 'aws-terraform',
            usernameVariable: 'AWS_ACCESS_KEY_ID',
            passwordVariable: 'AWS_SECRET_ACCESS_KEY'
          )
        ]) {
          //  For Testing / Debugging:
          sh 'aws sts get-caller-identity || echo "STS failed"'
          sh 'terraform plan -out=tfplan -input=false'
        }
      }
    }

    stage('Deploy: Terraform apply') {
      steps {
        withCredentials([
          usernamePassword(
            credentialsId: 'aws-terraform',
            usernameVariable: 'AWS_ACCESS_KEY_ID',
            passwordVariable: 'AWS_SECRET_ACCESS_KEY'
          )
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
