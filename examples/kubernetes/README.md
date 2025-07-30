# Kubernetes Examples

## fastapi-get-namespaces-without-client-authorization

Assuming you are in the root of this repository, ensure you have two terminals open.

In Terminal 1, run the following:

```bash
# Deploy the example
cd examples/kubernetes/fastapi-get-namespaces-without-client-authorization

kubectl apply -f deployment.yaml

# OPTIONAL: Ensure the pod is running
kubectl get all -n testing

# Port forward to the running pod:
kubectl port-forward $(kubectl get pods -lapp=fastapi-test --output jsonpath='{.items[0].metadata.name}' -n testing) -n testing 9090:8080
```

In terminal 2:

```bash
# Test:
curl -s http://localhost:9090/namespaces
```

You should see a JSON output with the namespaces in the cluster.

## Testing Fast API Deployment

A second deployment example is in the directory `run-once-job`. When deploying this manifest, two resources are deployed:

* A once off `Job` that will test connectivity to the Fast API service
* A `Pod` that can be used to gain a shell from where some manual tests can be done.

To deploy, run the following in another terminal:

```bash
# Assuming you are running from the repository root... 
cd examples/kubernetes/run-once-job

kubectl apply -f deployment.yaml
```

You can use `kubectl logs` to view the logs of the `Job`.

You can also obtain a shell into the running `Pod` for more manual type testing.
