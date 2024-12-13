pipeline {
    agent any
    environment {
        NEW_VERSION = '1.3.0'
    }
    stages {
        stage("build") {
            steps {
                echo 'Building the application...'
                echo "Building version ${NEW_VERSION}"
            }
        }

        stage("test") {
            when {
                expression { env.BRANCH_NAME == 'dev' }
            }
            steps {
                echo 'Testing the application...'
            }
        }

        stage("deploy") {
            steps {
                echo 'Deploying the application...'
                withCredentials([
                    usernamePassword(credentialsId: 'server-credentials', usernameVariable: 'USER', passwordVariable: 'PWD')
                ]) {
                    sh '''
                        echo "Deploying with user: ${USER}"
                        # Replace with your actual deployment script
                        some_script.sh ${USER} ${PWD}
                    '''
                }
            }
        }
    }
}
