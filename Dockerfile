ARG IMAGE_TAG=3.12.9-bookworm
FROM docker.io/python:${IMAGE_TAG}

LABEL version="3.12.9-1"
LABEL description="A general purpose Python image with common Python packages installed that could be useful in AWS and Kubernetes environments."

# Update the system and install some pre-requisites
RUN apt update && apt upgrade -y && apt -y install python3-dev curl zip git mc vim

# Install some common Python modules
ARG ADDITIONAL_PYTHON_PACKAGES="flask gunicorn Twisted valkey confluent_kafka fastavro"
RUN pip3 install boto3 pyyaml GitPython requests kr8s kubernetes fastapi "psycopg[binary]" "uvicorn[standard]" $ADDITIONAL_PYTHON_PACKAGES

# Install the AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

# Install Helm and Kubectl CLI tools
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Expose a common volume
RUN mkdir /data
VOLUME [ "/data" ]
