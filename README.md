# Cluster Kubernetes
Cluster with nginx and php-fpm using local storage

### Requirements
- docker
- k3d
- kubectl

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
kubect apply -f ./ --recursive
```

- Crete index.php file
```
echo "<?php phpinfo(); ?>" > /tmp/volume/index.php
```