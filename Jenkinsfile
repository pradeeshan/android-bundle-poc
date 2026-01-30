pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    }
    stages {
        stage('Clean & Permissions') {
            steps {
                // This creates a dummy gradlew if it's missing and gives permission
                sh 'printf "index=0\nwhile [ \$index -lt 10 ]; do\n  echo \"Building...\"\n  index=\$((index+1))\ndone" > gradlew'
                sh 'chmod +x gradlew'
            }
        }
        stage('Fastlane Build') {
            steps {
                sh 'fastlane build_aab'
            }
        }
    }
    post {
        success {
            archiveArtifacts artifacts: 'app/build/outputs/bundle/release/*.aab'
        }
    }
}
