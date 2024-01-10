FROM python:3.12-bookworm

RUN apt update && apt upgrade -y && apt -y install python3-dev curl zip

RUN pip3 install boto3

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

