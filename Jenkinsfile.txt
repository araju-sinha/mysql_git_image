pipeline {
  environment {
    registry = "araju024/mysql_image"
    registryCredential = 'araju_docker'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
	    git credentialsId: 'bd8cbf0a-a257-422d-90dd-ac9175393dac', url: 'hthttps://github.com/OCTO01032020-araju/mysql_git_image.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
