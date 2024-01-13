ARG IMAGE_TAG=3.12-bookworm
FROM python:${IMAGE_TAG}

LABEL version="1.0"
LABEL description="A general purpose Python image with common Python packages installed that could be useful in AWS and Kubernetes environments."

# Update the system and install some pre-requisites
RUN apt update && apt upgrade -y && apt -y install python3-dev curl zip git

# Install some common Python modules
ARG ADDITIONAL_PYTHON_PACKAGES="flask gunicorn Twisted"
RUN pip3 install boto3 pyyaml GitPython requests kr8s kubernetes fastapi "uvicorn[standard]" $ADDITIONAL_PYTHON_PACKAGES

# Install the AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

# Expose a common volume
RUN mkdir /data
VOLUME [ "/data" ]
