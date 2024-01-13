# Kubernetes Examples

## fastapi-get-namespaces-without-client-authorization

Assuming you are in the root of this repository, ensure you have two terminals open.

In Terminal 1, run the following:

```shell
# Deploy the example
cd examples/kubernetes/fastapi-get-namespaces-without-client-authorization

kubectl apply -f deployment.yaml

# OPTIONAL: Ensure the pod is running
kubectl get all -n testing

# Port forward to the running pod:
kubectl port-forward $(kubectl get pods -lapp=fastapi-test --output jsonpath='{.items[0].metadata.name}' -n testing) -n testing 9090:8080
```

In terminal 2:

```shell
# Test:
curl -s http://localhost:9090/namespaces
```

You should see a JSON output with the namespaces in the cluster.
