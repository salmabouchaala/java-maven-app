// CODE_CHANGES = getGitCahnges()
pipeline{
    agent any
    
    stages{
        stage("build"){
            // when{
            //     expression{
            //        CODE_CHANGES == false
            //     }
            // }
            steps{
                echo 'building the application...'
                echo 'building the application...'
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
