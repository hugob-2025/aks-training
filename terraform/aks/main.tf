data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  dns_prefix          = var.cluster_name

  sku_tier = "Free"

  default_node_pool {
    name       = "system"
    node_count = var.node_count
    vm_size    = var.vm_size

    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = merge(data.azurerm_resource_group.this.tags, var.tags)

  lifecycle {
    ignore_changes = [tags]
  }
}