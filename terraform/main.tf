resource "azurerm_resource_group" "k8s_cluster" {
  name     = var.name_resource_group
  location = var.location_resource_group

  tags = var.tags
}

resource "azurerm_virtual_network" "k8s_cluster" {
  name                = var.name_virtual_network
  address_space       = var.address_space_virtual_network
  location            = azurerm_resource_group.k8s_cluster.location
  resource_group_name = azurerm_resource_group.k8s_cluster.name

  tags = var.tags
}

resource "azurerm_subnet" "k8s_cluster" {
  name                 = var.name_subnet
  resource_group_name  = azurerm_resource_group.k8s_cluster.name
  virtual_network_name = azurerm_virtual_network.k8s_cluster.name
  address_prefixes     = var.address_prefixes_subnet
}

resource "azurerm_network_security_group" "k8s_cluster" {
  name                = var.name_network_security_group
  location            = azurerm_resource_group.k8s_cluster.location
  resource_group_name = azurerm_resource_group.k8s_cluster.name

  tags = var.tags
}

resource "azurerm_network_interface" "k8s_cluster" {
  name                = var.name_network_interface
  location            = azurerm_resource_group.k8s_cluster.location
  resource_group_name = azurerm_resource_group.k8s_cluster.name

  ip_configuration {
    name                          = var.name_ip_configuration
    subnet_id                     = azurerm_subnet.k8s_cluster.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "k8s_cluster" {
  name                = var.name_kubernetes_cluster
  location            = azurerm_resource_group.k8s_cluster.location
  resource_group_name = azurerm_resource_group.k8s_cluster.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "nodepool"
    node_count = 1
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_mssql_server" "k8s_cluster_sql_server" {
  name                         = var.name_mssql_server
  resource_group_name          = azurerm_resource_group.k8s_cluster.name
  location                     = azurerm_resource_group.k8s_cluster.location
  version                      = var.version_mssql_server
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_firewall_rule" "k8s_cluster_firewall_rule" {
  name             = var.name_mssql_firewall_rule
  server_id        = azurerm_mssql_server.k8s_cluster_sql_server.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}

resource "azurerm_cosmosdb_postgresql_cluster" "cosmosdb_postgresql_cluster" {
  name                            = var.name_cosmosdb_postgresql_cluster
  resource_group_name             = azurerm_resource_group.k8s_cluster.name
  location                        = azurerm_resource_group.k8s_cluster.location
  administrator_login_password    = var.administrator_login_password_cosmosdb
  coordinator_storage_quota_in_mb = var.coordinator_storage_quota_in_mb
  coordinator_vcore_count         = var.coordinator_vcore_count
  node_count                      = var.node_count_cosmosdb
}

resource "azurerm_cosmosdb_postgresql_role" "cosmosdb_postgresql_role" {
  name       = var.name_cosmosdb_postgresql_role
  cluster_id = azurerm_cosmosdb_postgresql_cluster.cosmosdb_postgresql_cluster.id
  password   = var.password_cosmosdb_postgresql_role
}
