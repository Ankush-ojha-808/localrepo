pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "ci-apache-builder"
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Ankush-ojha-808/localrepo.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                sh 'mkdir -p build && cp -r * build/'
            }
        }

        stage('Docker Build & Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo "Building Docker image and deploying to port 82..."
                sh """
                    docker build -t ${DOCKER_IMAGE} .
                    docker rm -f deployed_app || true
                    docker run -d -p 82:80 --name deployed_app ${DOCKER_IMAGE}
                """
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
