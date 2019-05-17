FROM jenkins/jenkins:lts

# Install docker
USER root
RUN curl -sSL https://get.docker.com/ | sh \
  && usermod -aG docker jenkins

USER jenkins

# Set number of executors
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Preinstall plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt \
  && echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

# Longer login timeouts. See https://stackoverflow.com/questions/26407541/increase-the-jenkins-login-timeout
ENV JAVA_OPTS=-DsessionTimeout=1440 -DsessionEviction=43200
