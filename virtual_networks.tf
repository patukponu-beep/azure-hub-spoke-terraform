#Creating Virtual Networks and their corresponding Subnets:

#VIRTUAL NETWORK : vnet_uk
resource "azurerm_virtual_network" "vnet_uk" {
    name = "vnet-uk"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space = ["10.10.0.0/16"]
}

#vnet_uk Subnet:
resource "azurerm_subnet" "uk_subnet1" {
    name = "subnet-1"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet_uk.name
    address_prefixes = ["10.10.1.0/24"]
  
}
#vnet_uk GatewaySubnet:
resource "azurerm_subnet" "gatewaysubnet" {
    name = "GatewaySubnet"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet_uk.name
    address_prefixes = ["10.10.0.0/26"]
  
}

#VIRTUAL NETWORK : vnet_sa
resource "azurerm_virtual_network" "vnet_sa" {
    name = "vnet-sa"
    resource_group_name = azurerm_resource_group.rg.name
    location = "South Africa North"
    address_space = ["10.20.0.0/16"]
}

#vnet_sa Subnet:
resource "azurerm_subnet" "sa_subnet1" {
    name = "subnet-1"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet_sa.name
    address_prefixes = ["10.20.0.0/24"]
  
}
