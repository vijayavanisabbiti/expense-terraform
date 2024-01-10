pipeline {
    agent {
        node {
            label "workstation"
        }
    }

    options {
        ansiColor('xterm')
    }

    stages {

        stage('Apply') {
            steps {
                sh 'terraform init -backend-config=dev-env/state.tfvars'
                /*sh 'terraform destroy -auto-approve -var-file=dev-env/main.tfvars'*/
                sh 'terraform destroy -auto-approve -var-file=dev-env/main.tfvars'
            }

/*            steps {
                sh 'terraform init -backend-config=prod-env/state.tfvars'
                sh 'terraform apply -auto-approve -var-file=prod-env/main.tfvars'
            }*/
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}