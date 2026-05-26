pipeline{
    agent any
    stages{
        stage('Checkout'){
            steps{
                checkout scm
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Format'){
            steps{
                sh 'terraform fmt -check'
            }
        }
        stage('Terraform Validate'){
            steps{
                sh 'terraform validate'
            }
        }

        stage("Security Scan bt tfscan"){
            steps{
                sh 'tfsec .'
            }
        }
        
        stage('Terraform Plan'){
            steps{
                sh 'terraform plan'
            }
        }

        stage('Approve'){
            steps{
                input 'Deploy infrastructure?'
            }
        }
        
        stage('Terraform Apply'){
            steps{
                sh 'terraform apply -auto-approve'
            }
        }
        
    }
}