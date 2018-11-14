node {
    stage('Checkout') {
        deleteDir()
        checkout scm
    }

    def GIT_COMMIT = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()

    def upload = false // whether or not to upload docker images to artifactory
    def tags = [] // tags for the resulting docker images

    if(env.BRANCH_NAME == 'master') {
        tags = [GIT_COMMIT, 'prod']
        upload = true
    }

    stage('Fetch Dependencies') {
        fetcher = docker.image('python:3.4-stretch')
        fetcher.inside() {
            sh "pip download --no-cache-dir -r ./requirements.txt"
        }
    }

    def serverImage = ''
    stage('Build') {
        serverImage = docker.build('deploy-playground')
    }

    stage('Test') {
        sh 'docker run -p 9999:8080 -t deploy-playground'
        sh 'env'
    }

    stage('Shipit') {
      sh 'echo "Shippin it"'
    }
}
