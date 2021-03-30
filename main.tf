data terraform_remote_state foundation {
  backend = "remote"
  config  = {
    organization = var.org
    workspaces   = {
      name       = var.foundation_workspace
    }
  }
}

resource azurerm_kubernetes_cluster k8s {
  name                  = var.aks_name
  location              = data.terraform_remote_state.foundation.outputs.rg_location
  resource_group_name   = data.terraform_remote_state.foundation.outputs.rg_name
  dns_prefix            = var.aks_dns_prefix

  default_node_pool {
    name                = var.aks_default_node_pool_name
    vm_size             = var.aks_default_node_pool_vm_size
    enable_auto_scaling = true
    min_count           = var.aks_default_node_min_count
    max_count           = var.aks_default_node_max_count
    node_count          = var.aks_default_node_node_count
  }

  linux_profile {
    admin_username = var.linux_admin_user

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  service_principal {
    client_id     = var.aks_client_id
    client_secret = var.aks_client_secret
  }

  tags = {
    owner                   = var.owner
    se-region               = var.se-region
    purpose                 = var.purpose
    ttl                     = var.ttl
    terraform               = "true"
  }

}