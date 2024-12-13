// CODE_CHANGES = getGitCahnges()
def gv
pipeline{
    agent any
    // tools{
    //     nodejs 'NodeJS'
    // }
    parameters{
        string(name: 'VERSION', defaultValue: '', description: 'version to deploy on prod')
        choice(name: 'VERSION', choices: ['1.1.0','1.2.0','1.3.0'], description: '')
        booleanParam( name: 'executeTests', defaultValue: true, description: '')
    }
    environment{
        NEW_VERSION = '1.3.0'
        SERVER_CREDENTIALS = credentials('server-credentials')
    }
    stages{
            stage("init"){
            steps{
               script{
                   gv = load "script.groovy"
               }
            }
        }
        stage("build"){
            // when{
            //     expression{
            //        CODE_CHANGES == false
            //     }
            // }
            script{
                gv.buildApp()
            }
            steps{
                echo 'building the application...'
                echo "building version ${NEW_VERSION}"
                // sh"npm install"
            }
        }

        stage("test"){
            when{
                expression{
                    // env.BRANCH_NAME == 'dev'
                    params.executeTests
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
                 echo "deploying version ${params.VERSION}"
                 // sh "${SERVER_CREDENTIALS}"
                 // withCredentials([
                 //     usernamePassword(credentials: 'server-credentials', usernameVariablr: USER,  passwordVariable:PWD)
                 //     ]){
                 //     sh "some script ${USER} ${PWD}"
                 // }
            }
        }
    }
}
