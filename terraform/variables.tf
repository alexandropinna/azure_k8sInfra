# tags
variable "tags" {
    type = map(string)
    default = {}
}

# azurerm_resource_group
variable "name_resource_group" {
    type = string 
}
variable "location_resource_group" {
    type = string
}

# azurerm_virtual_network
variable "name_virtual_network" {
    type = string
}
variable "address_space_virtual_network" {
    type = list(string)
}

# azurerm_subnet
variable "name_subnet" {
    type = string
}
variable "address_prefixes_subnet" {
    type = list(string)
}

# azurerm_network_security_group
variable "name_network_security_group" {
    type = string
}

# azurerm_network_interface
variable "name_network_interface" {
    type = string
}
variable "name_ip_configuration" {
    type = string 
}
variable "private_ip_address_allocation" {
    type = string
}

# azurerm_public_ip
variable "name_public_ip" {
    type = string
}

# azurerm_kubernetes_cluster
variable "name_kubernetes_cluster" {
    type = string
}
variable "dns_prefix" {
    type = string
}
variable "vm_size" {
    type = string
}

# azurerm_lb
variable "name_lb" {
    type = string
}
variable "name_frontend_ip_configuration" {
    type = string
}

# azurerm_mssql_server
variable "name_mssql_server" {
    type = string
}
variable "version_mssql_server" {
    type = string
}
variable "administrator_login" {
    type = string
}
variable "administrator_login_password" {
    type = string
}

# azurerm_mssql_firewall_rule
variable "name_mssql_firewall_rule" {
    type = string
}
variable "start_ip_address" {
    type = string
}
variable "end_ip_address" {
    type = string
}

# azurerm_cosmosdb_postgresql_cluster
variable "name_cosmosdb_postgresql_cluster" {
    type = string
}
variable "administrator_login_password_cosmosdb" {
    type = string
}
variable "coordinator_storage_quota_in_mb" {
    type = string
}
variable "coordinator_vcore_count" {
    type = string
}
variable "node_count_cosmosdb" {
    type = string
}

# azurerm_cosmosdb_postgresql_role
variable "name_cosmosdb_postgresql_role" {
    type = string
}
variable "password_cosmosdb_postgresql_role" {
    type = string
}