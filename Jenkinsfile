pipeline {
   agent any
   stages {
    stage('Git Checkout') {
      steps {
        echo 'pulling...';
         git branch:'main',
         url : 'https://github.com/saifhendili/devOps_Tpachat';
         
         }
        }
    stage('testing maven') {
      steps {
        sh """mvn -version"""
         
         }
        }
    stage('Test mvn') {
            steps {
              sh """ mvn -DskipTests clean package """ 
                sh """ mvn install """;
                sh """ mvn test """;
            }
        }
    stage("MVN SonarQube") {
      
       		steps {
        	  sh "mvn sonar:sonar \
  				-Dsonar.projectKey=socarqube \
  				-Dsonar.host.url=http://192.168.0.5:9000 \
  				-Dsonar.login=6e96b26c7adf6d429cc30258cf59c6aa8e33b666"
      	}
    }
    stage('Nexus') {
      steps {
        sh 'mvn clean deploy -Dmaven.test.skip=true'
      }
    }
    stage('Build Docker'){
      steps{
        sh 'docker build -t saifhendili/devops .'
       }
    }
    stage('Docker Login'){
      steps{
        sh 'docker login -u saifhendili -p "girod 131313"'
       }
        }
       }
      }
     