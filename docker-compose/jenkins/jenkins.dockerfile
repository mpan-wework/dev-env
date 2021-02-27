FROM jenkins/jenkins:2.281-alpine
USER root
RUN apk --update add build-base docker && rm -rf /var/cache/apk/*
COPY jenkins.plugins.yaml /usr/share/jenkins/ref/plugins.yaml
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.yaml
