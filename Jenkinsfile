pipeline {
  agent any
  parameters {
      booleanParam(name: 'destroy', defaultValue: false, description: 'Check to destroy Terraform instead of applying.')
  }
  stages{
    stage('Terraform Init') {
      steps {
        withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: "yarden-aws",
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {             
        sh 'terraform init'
        sh 'terraform apply -auto-approve  -no-color'
        }
        
      }
    }

    stage('Terraform Destroy') {
      when {
        expression { params.destroy }
      }
      steps {
        withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: "yarden-aws",
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]]) {   
        sh 'terraform destroy -auto-approve'
        }
      }
    }
  }
}