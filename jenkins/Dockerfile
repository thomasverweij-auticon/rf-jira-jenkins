# Base Jenkins LTS image
FROM jenkins/jenkins:lts

USER root

# Install Python, pip, and virtualenv
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt-get clean

# Optional: install Robot Framework and tools globally
# RUN pip install robotframework robotframework-seleniumlibrary

# Fix permissions and switch back to Jenkins user
RUN chown -R jenkins:jenkins /var/jenkins_home
USER jenkins