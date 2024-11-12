pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Tung-1991/k8scicdnodejsapp.git', branch: 'main'
            }
        }
        stage('Run build.sh and cleanimage.sh') {
            steps {
                sh '''
                sudo -u vagrant bash -c "
                cd $WORKSPACE/nodejs-demo-k8s/
                bash build.sh
                bash cleanimage.sh
                "
                '''
            }
        }
        stage('Deploy with Helm') {
            steps {
                sh '''
                sudo -u vagrant bash -c "
                cd $WORKSPACE/nodejs-demo-k8s/
                helm upgrade --install app-demo ./app-demo --set image.tag=v$(cat /nodejs-demo-k8s/VERSION) -f app-demo-value.yaml
                "
                '''
            }
        }
    }
}
