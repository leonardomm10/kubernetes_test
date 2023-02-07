# Cluster Kubernetes
Cluster with nginx and php-fpm using local storage for mysql to deploy an php api.

### Requirements
- docker   -> https://docs.docker.com/engine/install/ubuntu/
- kubectl  -> https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- k3d
```
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
```

### Cluster Configuration
- Create the directory to persist data
```
mkdir -p /tmp/volume
```
- Create a k3d cluster
```
k3d cluster create mycluster -p "80:30000@loadbalancer" --volume /tmp/volume:/tmp/volume
```

### Execute

- Apply the manifests
```
kubectl apply -f k8s/ --recursive
```
