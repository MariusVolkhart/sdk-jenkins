# sdk-jenkins
Jenkins setup for the SDK

## How to use
Run `docker run -d -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --dns=192.168.100.23 --dns=192.168.100.24 --name jenkins --restart=always --privileged mariusvolkhart/jenkins:latest`. See [Jenkins Docker Docs](https://github.com/jenkinsci/docker) for details on configuring
