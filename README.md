# sdk-jenkins
Jenkins setup for the SDK

## How to use
Run `docker run -d -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --dns=192.168.100.23 --dns=192.168.100.24 --name jenkins --restart=always --privileged mariusvolkhart/jenkins:latest`. See [Jenkins Docker Docs](https://github.com/jenkinsci/docker) for details on configuring

## Updating
### Docker
To update the docker image being used, `docker pull mariusvolkhart/jenkins` before redeploying the docker container.

### Plugins
To update the plugins edit `plugins.txt.` To get the list of plugins currently being used,
```bash
JENKINS_HOST=username:password@myhost.com:port
curl -sSL "http://$JENKINS_HOST/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/'
```
