pipeline {
    agent any
    stages {
        stage('Clone Repository on Jenkins Host') {
            steps {
                git url: 'https://github.com/Tung-1991/k8scicdnodejsapp.git', branch: 'main'
            }
        }
        stage('Deploy with Helm on Jenkins Host') {
            steps {
                sh '''
                sudo -u vagrant bash -c "
                cd $WORKSPACE/nodejs-demo-k8s/
                helm upgrade --install app-demo ./app-demo --set image.tag=v$(cat $WORKSPACE/VERSION) -f app-demo-value.yaml
                "
                '''
            }
        }
    }
}