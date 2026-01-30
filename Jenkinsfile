pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    }
    stages {
        stage('Permissions') {
            steps {
                // Just give the real file permission, don't create a new one
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
