variable "cluster_name" {
  description = "A name for the Kubernetes cluster"
  type        = string
}

variable "region" {
  description = "The slug identifier for the region where the Kubernetes cluster will be created"
  type        = string
}

variable "digitalocean_kubernetes_version" {
  description = "The slug identifier for the version of Kubernetes used for the cluster"
  type        = string
}

variable "node_size" {
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
  type        = string
}

variable "auto_scale" {
  description = "Enable auto-scaling of the number of nodes in the node pool within the given min/max range"
  type        = bool
}

variable "min_nodes" {
  description = "If auto-scaling is enabled, this represents the minimum number of nodes that the node pool can be scaled down to"
  type        = number
}

variable "max_nodes" {
  description = "If auto-scaling is enabled, this represents the maximum number of nodes that the node pool can be scaled up to"
  type        = number
}

variable "do_token" {
  description = "Digital Ocean personal access token"
  type        = string
}