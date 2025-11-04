pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/abeilharz/Terraform-Project-25.git'
      }
    }

    stage('Build 1: Terraform init') {
      steps {
        sh 'terraform init -input=false'
      }
    }

    stage('Build 2: Terraform plan') {
      steps {
        sh 'terraform plan -out=tfplan -input=false'
      }
    }

    stage('Deploy: Terraform apply') {
      steps {
        sh 'terraform apply -auto-approve tfplan || terraform apply -auto-approve -input=false'
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
