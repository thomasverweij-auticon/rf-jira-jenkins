pipeline {
    agent any

    stages {
        stage('python requirements') {
            steps {
                sh '''
                    python3 -m venv ./venv
                    . ./venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('run tests') {
            steps {
                sh '''
                    . ./venv/bin/activate
                    robot --outputdir results --xunit xunit.xml tests/
                '''
            }
        }

        stage('publish results') {
            steps {
                robot outputPath: 'results'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**/*', fingerprint: true
            junit 'results/xunit.xml'
        }
    }
}
