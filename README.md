# container-python4aws

Creating a OCI complaint container using Dockerfile that includes Python, AWS CLI and boto3

## Use Cases

* Python based deployments in Kubernetes (see [examples](./examples/kubernetes/README.md))
* Running Python scripts using the Docker image (EC2 instances etc.)
* Where you need to run a Python application using a specific version of Python that is not installed on the host.
* Probably hundreds of other use cases...

# Build a Container Image using Docker

Run the following command

```shell
docker build -t python4aws .
```

You should now be able to confirm all is working as expected:

```shell
# Confirm Python Version
docker run --rm python4aws python --version
# OUTPUT (example): Python 3.12.1

# Confirm AWS CLI version
docker run --rm python4aws aws --version
# OUTPUT (example): aws-cli/2.15.8 Python/3.11.6 Linux/6.5.0-10010-tuxedo exe/x86_64.debian.12 prompt/off
```

## Build a specific version of Python

Example to build on Python 3.10:

```shell
docker build -t python4aws --build-arg="IMAGE_TAG=3.10-bookworm" .
```

Consult [The Python Docker Hub Page](https://hub.docker.com/_/python) for a complete list of available tags. Ensure a Debian based image is selected.
