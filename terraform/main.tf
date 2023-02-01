resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = "k8s"
  region  = var.region
  version = "1.25.4-do.0"
  tags = [ "terraform", "k8s" ]

  node_pool {
    name      = "autoscale-k8s-pool"
    size      = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes = 1
    max_nodes = 2
  }
}

resource "local_file" "name" {
  content  = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
  filename = "kube_config.yaml"
}