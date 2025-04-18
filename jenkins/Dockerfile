# Base Jenkins LTS image
FROM jenkins/jenkins:lts

USER root


RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm && \
    npx playwright install-deps && \
    mkdir -p /opt/pw-browsers && \
    apt-get clean

RUN chown -R jenkins:jenkins /var/jenkins_home
