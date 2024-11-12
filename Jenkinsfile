pipeline {
    agent any
    stages {
        stage('Clone Repository on Jenkins Host') {
            steps {
                git url: 'https://github.com/Tung-1991/k8scicdnodejsapp.git', branch: 'main'
            }
        }
        stage('Update Source and Run Scripts on Machine B') {
            steps {
                sh '''
                sshpass -p 'vagrant' ssh -o StrictHostKeyChecking=no vagrant@192.168.42.114 <<EOF
                if [ ! -d "/home/vagrant/nodejs-demo-k8s/" ]; then
                    git clone -b main https://github.com/Tung-1991/k8scicdnodejsapp.git /home/vagrant/nodejs-demo-k8s/
                else
                    cd /home/vagrant/nodejs-demo-k8s/
                    git fetch --all
                    git reset --hard origin/main
                fi
                cd /home/vagrant/nodejs-demo-k8s/nodejs-demo-k8s
                bash build.sh
                bash cleanimage.sh
                EOF
                '''
            }
        }
        stage('Deploy with Helm on Jenkins Host') {
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
