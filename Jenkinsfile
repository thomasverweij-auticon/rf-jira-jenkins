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
                    rfbrowser init --skip-browsers
                    PLAYWRIGHT_BROWSERS_PATH=/opt/pw-browsers robot --outputdir results --xunit xunit.xml --nostatusrc tests/
                '''
            }
        }

        stage('publish results') {
            steps {
                robot outputPath: 'results'
            }
        }

        stage('publish to xray') {
            steps {
                step([$class: 'XrayImportBuilder', endpointName: '/robot', projectKey: 'XRAYT', importToSameExecution: 'true', importFilePath: 'results/output.xml', serverInstance: 'b1ddff7d-c750-42dd-8ab6-9534e5db8315'])
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
