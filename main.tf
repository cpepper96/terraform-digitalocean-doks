resource "digitalocean_kubernetes_cluster" "doks-cluster" {
  name    = var.cluster_name
  region  = var.region
  version = var.digitalocean_kubernetes_version

  node_pool {
    name       = format("%s-core", var.cluster_name)
    size       = var.node_size
    auto_scale = var.auto_scale
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
  }
}
