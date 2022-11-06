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
  -Dsonar.projectKey=sonarqube \
  -Dsonar.host.url=http://192.168.1.19:9000 \
  -Dsonar.login=5ad19481d4916f75d2076ccc181afd3adf1b5aa9"
      	}
    }
    stage('Nexus') {
      steps {
        sh 'mvn clean deploy -Dmaven.test.skip=true'
      }
    }
       }
      }