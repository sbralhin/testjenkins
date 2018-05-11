pipeline {

    agent any
    stages {
        stage('setup') {
            steps {
                script {
                    build_name  = "${BUILD_NUMBER}"
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

}
