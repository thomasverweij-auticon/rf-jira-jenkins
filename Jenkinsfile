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
                    robot --outputdir results --xunit xunit.xml --nostatusrc tests/
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
                step([$class: 'XrayImportBuilder', endpointName: '/robot', projectKey: 'XRAYT', importToSameExecution: 'false', importFilePath: 'results/output.xml', serverInstance: '6eeab126-107f-4572-86f8-53ed250a7015'])
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
