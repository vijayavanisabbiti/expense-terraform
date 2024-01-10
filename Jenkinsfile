pipeline {
    agent {
        node {
            label "workstation"
        }
    }

    options {
        ansiColor('xterm')
    }

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose TF Action')
    }

    stages {

        stage('TF Action') {
            parallel {

                stage('DEV Env') {
                    steps {
                        dir('DEV') {
                            git branch: 'main', url: 'https://github.com/vijayavanisabbiti/expense-terraform'
                            sh 'terraform init -backend-config=dev-env/state.tfvars'
                            sh 'terraform ${ACTION} -auto-approve -var-file=env-dev/main.tfvars'
                        }
                    }
                }

                stage('PROD Env') {
                    steps {
                        dir('PROD') {
                            git branch: 'main', url: 'https://github.com/vijayavanisabbiti/expense-terraform'
                            sh 'terraform init -backend-config=prod-env/state.tfvars'
                            sh 'terraform ${ACTION} -auto-approve -var-file=env-prod/main.tfvars'
                        }
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}