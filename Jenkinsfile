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

        stage('publish to xray') {
            steps {
                step([$class: 'XrayImportBuilder', endpointName: '/robot', importFilePath: 'result/output.xml', serverInstance: 'b1ddff7d-c750-42dd-8ab6-9534e5db8315'])
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
