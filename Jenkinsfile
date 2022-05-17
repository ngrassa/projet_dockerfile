node{
   notifyStarted()
   /* ... existing build steps ... */

       stage('Clone') {
        git credentialsId: 'jenkins', url: 'git@gitlab.com:mahmoudbs/projet_j2ee.git'

    }
   
     stage('SonarQube analysis') {
        withSonarQubeEnv {
            def mavenHome = tool name: "Maven", type: "maven"
            def mavenCMD = "${mavenHome}/bin/mvn"
            sh "${mavenCMD} clean package sonar:sonar"


        }
    }


 stage('Quality Gate') {
 waitForQualityGate abortPipeline: true

 }
 stage('Build') {
      def mavenHome = tool name: "Maven", type: "maven"
            def mavenCMD = "${mavenHome}/bin/mvn"
            sh "${mavenCMD} clean install package"

 }

 stage('Deplpoy') {
 deploy adapters: [tomcat8(credentialsId: 'tomcat', path: '', url: 'http://3.71.108.186:8082')], contextPath: '/webapp', war: '**/*.war'
 }
 notifySuccessful()
}


def notifyStarted() { 
  // send to email
  emailext (
      subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
      recipientProviders: [[$class: 'DevelopersRecipientProvider']]
    )
  }

def notifySuccessful() {
 
 hipchatSend (color: 'YELLOW', notify: true, 
       message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})" 
     ) 
  emailext (
      subject: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
      recipientProviders: [[$class: 'DevelopersRecipientProvider']],

    )
  
}


    
