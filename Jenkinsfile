pipeline {
   environment {
        registry = "srinathsilla/student-survey-form"
        registryCredential = 'dockerhub'
    }
   agent any

   stages {
      stage('Build') {
         steps {
            echo 'Building...'
            script{
               sh 'rm -rf *.war'
               sh 'jar -cvf student-survey-form.war -C src/main/webapp/ .'
               sh 'sudo usermod -a -G docker jenkins'
               docker.withRegistry('',registryCredential){
                  def customImage = docker.build("student-survey-form:${env.BUILD_NUMBER}")
               }
            }
         }
      }

    //   stage('Push Image to Dockerhub') {
    //      steps {
    //         echo 'pushing to image to docker hub'
    //         script{
    //            docker.withRegistry('',registryCredential){
    //               sh "docker push srinathsilla/student-survey-form:${env.BUILD_NUMBER}"
    //            }
    //         }
    //      }
    //   }

    //   stage('Deploying to Rancher to single node(deployed in 3 replicas)') {
    //      steps {
    //         echo 'deploying on kubernetes cluster'
    //         script{
    //            sh "kubectl set image deployment/deploymentone container-0=srinathsilla/student-survey-form:${env.BUILD_NUMBER}"
    //         }
    //      }
    //   }
   }
}
