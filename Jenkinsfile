pipeline {
    agent any

    environment {
        // This ensures Jenkins can find Fastlane and Android tools on your Mac
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                // Ensure fastlane is ready
                sh 'bundle install || echo "Fastlane ready"'
            }
        }

        stage('Build Bundle (.aab)') {
            steps {
                // This calls the lane we defined in your Fastlane/Fastfile
                sh 'fastlane build_aab'
            }
        }
    }

    post {
        success {
            // This makes the .aab file appear on the Jenkins dashboard for download
            archiveArtifacts artifacts: 'app/build/outputs/bundle/release/*.aab', fingerprint: true
        }
    }
}
