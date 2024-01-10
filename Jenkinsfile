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
                sh 'terraform apply -auto-approve -var-file=dev-env/main.tfvars'
            }


        }
    }

    post {
        always {
            cleanWs()
        }
    }
}