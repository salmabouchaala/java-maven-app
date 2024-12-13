// CODE_CHANGES = getGitCahnges()
pipeline{
    agent any
    environment{
        NEW_VERSIN = '1.3.0'
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
                echo 'building version ${NEW_VERSION}'
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
            }
        }
    }
}
