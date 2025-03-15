# container-python4aws

Creating a OCI complaint container using a container file that includes Python, AWS CLI, boto3 with various other Python packages typically required in cloud and Kubernetes scenarios.

## Use Cases

* Python based deployments in Kubernetes (see [examples](./examples/kubernetes/README.md))
* Running Python scripts using the container image (EC2 instances etc.)
* Where you need to run a Python application using a specific version of Python that is not installed on the host.
* Probably hundreds of other use cases...

# Build a Container Image using podman

Run the following command

```shell
podman build -t python4aws .
```

You should now be able to confirm all is working as expected:

```shell
# Confirm Python Version
podman run --rm python4aws python --version
# OUTPUT (example): Python 3.13.2

# Confirm AWS CLI version
podman run --rm python4aws aws --version
# OUTPUT (example): aws-cli/2.24.24 Python/3.12.9 Linux/6.11.0-109018 exe/x86_64.debian.12
```

## Build a specific version of Python

Example to build on Python 3.10:

```shell
podman build -t python4aws --build-arg="IMAGE_TAG=3.10-bookworm" .
```

Consult [The Python Docker Hub Page](https://hub.docker.com/_/python) for a complete list of available tags. Ensure a Debian based image is selected.
