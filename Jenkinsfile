node {
    properties([
      parameters([
          string(name: 'REGISTRY', defaultValue: 'http://localhost:5000', description: 'The target registry' ),
          string(name: 'REGISTRY_CREDS', defaultValue: 'admin:docker', description: 'The target registry credentials' ),
          string(name: 'BUILD_ENV_TAG', defaultValue: 'production', description: 'The target environment (dev,staging,production)' )
             ])
      ])

    stage('Checkout') {
        deleteDir()
        checkout scm
    }

    def GIT_COMMIT = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
    def GIT_BRANCH = sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()

    def upload = false // whether or not to upload docker images to artifactory
    def tags = [] // tags for the resulting docker images

    if(env.BRANCH_NAME == 'master') {
        tags = [GIT_COMMIT, 'prod']
        upload = true
    }

    if(env.BRANCH_NAME == 'staging') {
        tags = [GIT_COMMIT, 'staging']
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
        sh 'echo "Building artifact ${BUILD_ENV_TAG}"'
        serverImage = docker.build('deploy-playground:${BUILD_ENV_TAG}')
    }

    stage('Test') {
      sh 'echo "Testin it"'
    }

    stage('Shipit') {
      sh "echo 'Shippin ${serverImage} to ${params.REGISTRY}'"
      docker.withRegistry( "${params.REGISTRY}" ) {
        serverImage.push()
      }
    }
}
