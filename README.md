# azure_k8sInfra

This Terraform configuration is designed to provision a set of Azure resources to create a Kubernetes cluster, a SQL Server, a Cosmos DB PostgreSQL cluster, and associated networking components.

## Resources Created

1. **Resource Group**: A resource group named according to the `var.name_resource_group` variable, located according to `var.location_resource_group`, and tagged with `var.tags`.

2. **Virtual Network**: A virtual network within the created resource group with a specified address space from `var.address_space_virtual_network` and tagged with `var.tags`.

3. **Subnet**: A subnet within the created virtual network, with address prefixes specified by `var.address_prefixes_subnet`.

4. **Network Security Group**: A network security group within the created resource group, located in the same location as the resource group, and tagged with `var.tags`.

5. **Network Interface**: A network interface within the created resource group, associated with the created subnet and with an IP configuration named according to `var.name_ip_configuration`. The IP address is allocated based on `var.private_ip_address_allocation` and the interface is tagged with `var.tags`.

6. **Kubernetes Cluster**: A Kubernetes cluster within the created resource group, with a default node pool of one node of size `var.vm_size`, and tagged with `var.tags`.

7. **SQL Server**: A SQL server within the created resource group, with a specified version from `var.version_mssql_server`, administrator login and password from `var.administrator_login` and `var.administrator_login_password` respectively.

8. **SQL Server Firewall Rule**: A firewall rule for the created SQL server, specifying the start and end IP address from `var.start_ip_address` and `var.end_ip_address`.

9. **Cosmos DB PostgreSQL Cluster**: A Cosmos DB PostgreSQL cluster within the created resource group, with specified storage quota, vcore count, and node count from `var.coordinator_storage_quota_in_mb`, `var.coordinator_vcore_count`, and `var.node_count_cosmosdb` respectively, and with an administrator password from `var.administrator_login_password_cosmosdb`.

10. **Cosmos DB PostgreSQL Role**: A role within the created Cosmos DB PostgreSQL cluster, with a specified name from `var.name_cosmosdb_postgresql_role` and password from `var.password_cosmosdb_postgresql_role`.

## Variables

The configuration uses a number of variables defined by the user, including names, locations, tags, address spaces, IP address configurations, node counts, sizes, versions, logins, and passwords. These variables need to be defined in a `variables.tf` file or provided as input when applying the Terraform configuration.

## Usage

To use this configuration, follow these steps:

1. **Define Variables**: Ensure all required variables are defined in a `variables.tf` file or are available to input during the Terraform apply phase.

2. **Initialize Terraform**: Run `terraform init` in the directory containing this configuration to initialize Terraform and download the necessary providers.

3. **Apply Configuration**: Run `terraform apply` and input the required variables if not defined in a file. Review the planned actions and approve the apply phase to provision the resources.

4. **Access Resources**: Once Terraform has successfully applied the configuration, access the resources through the Azure Portal or Azure CLI using the credentials and names specified in the variables.

5. **Destroy Resources**: When the resources are no longer needed, run `terraform destroy` and approve the destruction of the resources.

## Considerations

- Ensure you have the necessary permissions to create resources in the specified Azure subscription.
- Review the costs associated with creating these resources in Azure and monitor usage to avoid unexpected charges.
- Securely manage sensitive information such as passwords and login details.
- Regularly review and update resource configurations to ensure security and compliance with organizational policies.

## Conclusion

This Terraform configuration provides a template for creating a set of interconnected resources in Azure, including a Kubernetes cluster, SQL Server, and Cosmos DB PostgreSQL cluster. Customize the variables and configurations to suit the specific needs of your project.