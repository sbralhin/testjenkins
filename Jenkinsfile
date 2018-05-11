def colorMake(String recipe) {
    ansiColor('xterm') { sh "make ${recipe}" }
}

pipeline {
    options { disableConcurrentBuilds() }
    agent none
    stages {
        stage('setup') {
            steps {
                script {
                    build_name  = "${JOB_NAME}-${BRANCH_NAME}-${BUILD_NUMBER}"
                    changesUrl  = "${env.RUN_CHANGES_DISPLAY_URL}"
                    consoleUrl  = "${env.BUILD_URL}/console"
                    registry    = "sergbr/testjenkins"
                    K8S_NAMESPACE = 'canplugdata-service-ns'
                }

            }
        }
        stage('build') {

            when { branch 'master' }
            steps {
                script {
                    sh  """
                        docker login -u sergbr -p Dblbvjcnm07!
                        """
                    def curImage = docker.build("${registry}")
                    curImage.push()
                }
                slackSend(color:'good', channel:'chef-deploys', message:"${build_name} image built")
            }
        }
        stage('release') {

            steps {
                script {

                    sh "kubectl create namespace '${K8S_NAMESPACE}'"

                }

            }
        }
    }
    post {
        success {
            slackSend(color:'good', channel:'teeeeststs', message:"${build_name} test succeeded")
                }
        failure {
            colorMake 'clean'
            slackSend(color:'bad', channel:'teeeeststs', message:"${build_name} failed: [<${changesUrl}|Changes>] [<${consoleUrl}|Console>]")
        }
    }
}
