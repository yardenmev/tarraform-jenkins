pipeline {
  agent any
  parameters {
      booleanParam(name: 'destroy', defaultValue: false, description: 'Check to destroy Terraform instead of applying.')
      string(name: 'VPC_NAME', defaultValue: 'yarden_vpc', description: 'name of the vpc')  
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
        sh 'terraform apply -var vpc_name=${VPC_NAME} -auto-approve  -no-color'
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