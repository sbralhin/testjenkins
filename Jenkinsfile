pipeline {

    agent any
    stages {
        stage('setup') {
            steps {
                script {
                    build_name  = "${BUILD_NUMBER}"
                    registry    = "sergbr/canplugdata-service-test"
                    K8S_NAMESPACE = 'canplugdata-service-ns'
                }

            }
        }
        stage('build') {
            when { branch 'develop' }
            steps {
                script {
                    sh  """
                        docker login -u sergbr -p dblbvjcnm07
                        """
                    def curImage = docker.build("${registry}")
                    curImage.push()
                }

            }
        }
        stage('release') {
            when { branch 'develop' }
            steps {
                script {

                    sh "echo Test PR reqest correct new branch"


                }

            }
        }
    }

}
