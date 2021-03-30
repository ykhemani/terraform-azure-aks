variable owner {
  type        = string
}

variable prefix {
  type        = string
}

variable se-region {
  type    = string
}

variable purpose {
  type    = string
  default = ""
}

variable ttl {
  type    = string
  default = "24"
}

variable org {
  type        = string
  description = "Name of organization where foundation_workspace exists."
}

variable foundation_workspace {
  type        = string
  description = "Name of Azure Foundation workspace where the resource group, vnet and subnet exist."
}

variable aks_name {
  type        = string
}

variable aks_dns_prefix {
  type        = string
  default     = "aks1"
}
variable aks_default_node_pool_name {
  type        = string
  default     = "default"
}

variable aks_default_node_pool_vm_size {
  type        = string
  default     = "Standard_D2_v2"
}

variable ssh_public_key {
  type        = string
}

variable linux_admin_user {
  type        = string
  default     = "ubuntu"
}

variable aks_client_id {
  type        = string
  description = "The Azure Client ID used for creating Azure load balancers."
}

variable aks_client_secret {
  type        = string
  description = "The Azure Client Secret used for creating Azure load balancers."
}