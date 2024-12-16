// CODE_CHANGES = getGitCahnges()
def gv
pipeline{
    agent any
    tools{
        maven 'Maven'
    }
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
            // stage("init"){
            // steps{
            //    script{
            //        gv = load "script.groovy"
            //    }
            // }
        // }
        stage("build jar"){
            // when{
            //     expression{
            //        CODE_CHANGES == false
            //     }
            // }
           
            steps{
                script{
                    echo "building the application..."
                    sh'mvn package'
                }
                // echo 'building the application...'
                // echo "building version ${NEW_VERSION}"
               
            }
        }
        stage("build image"){
                
                steps{
                    script{
                        echo "building the docker image..."
                        withCredentials([usernamePassword(credentialsId:'docker-hub-repo', passwordVariable:'PASS',usernameVariable:'salmabouchaala')]){
                            sh "docker build -t salmabouchaala/my-repo:jma-2.0 ."
                            sh 'echo $salma21189862 | docker login -u "salmabouchaala" --password-stdin'
                            sh 'docker push salmabouchaala/my-repo:jma-2.0'
                        }
                    }
                }
            }

        // stage("test"){
        //     when{
        //         expression{
        //             // env.BRANCH_NAME == 'dev'
        //             params.executeTests
        //         }
        //     }
        //     steps{
        //          echo 'testing the application...'
        //     }
        // }

        // stage("deploy"){
        //     // input{
        //     //     message "Select the environment to deploy to"
        //     //     ok "Done"
        //     //     parameters{
        //     //         choice(name: 'ONE', choices: ['dev','staging','prod'], description:'')
        //     //         choice(name: 'TWO', choices: ['dev','staging','prod'], description:'')
        //     //     }
        //     // }
        //     steps{
        //         script{
        //             env = input message : "Select the environment to deploy to", ok: "Done", parameters: [choice(name: 'ONE', choices: ['dev','staging','prod'],description:'')]
        //             // echo "Deploying to ${ONE}"
        //             // echo "Deploying to ${TWO}"
        //         }  
        //          echo 'deploying the application...'
        //          echo "deploying with ${SERVER_CREDENTIALS}"
        //          echo "deploying version ${params.VERSION}"
        //          // echo "deploying to ${ENV}"
        //          // sh "${SERVER_CREDENTIALS}"
        //          // withCredentials([
        //          //     usernamePassword(credentials: 'server-credentials', usernameVariablr: USER,  passwordVariable:PWD)
        //          //     ]){
        //          //     sh "some script ${USER} ${PWD}"
        //          // }
        //     }
        // }
    }
}
