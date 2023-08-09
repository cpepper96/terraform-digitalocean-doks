# Terraform Digital Ocean Kubernetes (DOKS) Module

This repo contains a simple module to deploy a [DOKS](https://docs.digitalocean.com/products/kubernetes/) cluster with a single autoscaling node pool.

# Deploying this module

To deploy this module you'll need to install [Terraform](https://docs.digitalocean.com/products/kubernetes/), have a Digital Ocean account with a [personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/), and install [doctl](https://docs.digitalocean.com/reference/doctl/how-to/install/).

For learning purposes I'd recommend forking this repo and then cloning your forked repo locally. Within the same directory as your freshly cloned repo, create a terraform.tfvars files where you can declare your input variables.

Example terraform.tfvars file:
```
cluster_name = "doks-test"
region = "sfo3"
digitalocean_kubernetes_version = "1.27"
node_size = "s-2vcpu-2gb"
auto_scale = true
min_nodes = 1
max_nodes = 3
do_token = <YOUR_TOKEN>
```

Run a Terraform plan with the following commands (in the same directory as your terraform.tfvars file):
```
terraform init
terraform plan
```

Expected output:
```
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # digitalocean_kubernetes_cluster.doks-cluster will be created
  + resource "digitalocean_kubernetes_cluster" "doks-cluster" {
      + cluster_subnet       = (known after apply)
      + created_at           = (known after apply)
      + endpoint             = (known after apply)
      + ha                   = false
      + id                   = (known after apply)
      + ipv4_address         = (known after apply)
      + kube_config          = (sensitive value)
      + name                 = "doks-test"
      + region               = "sfo3"
      + registry_integration = false
      + service_subnet       = (known after apply)
      + status               = (known after apply)
      + surge_upgrade        = true
      + updated_at           = (known after apply)
      + urn                  = (known after apply)
      + version              = "1.27"
      + vpc_uuid             = (known after apply)

      + node_pool {
          + actual_node_count = (known after apply)
          + auto_scale        = true
          + id                = (known after apply)
          + max_nodes         = 3
          + min_nodes         = 1
          + name              = "doks-test-core"
          + nodes             = (known after apply)
          + size              = "s-2vcpu-2gb"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

You can then deploy the cluster with the following command:
```
terraform apply
```

In a few minutes your cluster should be up and running in your DO account!

# Resources

https://developer.hashicorp.com/terraform/docs

https://kubernetes.io/docs/tasks/tools/#kubectl
