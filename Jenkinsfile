// CODE_CHANGES = getGitCahnges()
pipeline{
    agent any
    environment{
        NEW_VERSION = '1.3.0'
        SERVER_CREDENTIALS = credentials('server-credentials')
    }
    stages{
        stage("build"){
            // when{
            //     expression{
            //        CODE_CHANGES == false
            //     }
            // }
            steps{
                echo 'building the application...'
                echo "building version ${NEW_VERSION}"
            }
        }
  
        stage("test"){
            when{
                expression{
                    env.BRANCH_NAME == 'dev'
                }
            }
            steps{
                 echo 'testing the application...'
            }
        }

        stage("deploy"){
            steps{
                 echo 'deploying the application...'
                 echo "deploying with ${SERVER_CREDENTIALS}"
                 sh "${SERVER_CREDENTIALS}"
            }
        }
    }
}
