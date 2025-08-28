FROM jenkins/jenkins:lts-jdk17

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    docker.io git awscli curl jq && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 999 docker || true && usermod -aG docker jenkins

USER jenkins
