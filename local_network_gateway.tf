#CREATING LOCAL NETWORK GATEWAY

resource "azurerm_local_network_gateway" "ln_gw1" {
    name = "onprem-lng1"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  gateway_address = var.onprem_primary_public_ip
  address_space =["172.16.10.0/24", "172.16.11.0/24"]

bgp_settings {
    asn                 = 65000
    bgp_peering_address = "169.254.21.2"
  }
}

resource "azurerm_local_network_gateway" "ln_gw2" {
    name                = "onprem-lng2"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    gateway_address = var.onprem_secondary_public_ip
    address_space =["172.16.10.0/24", "172.16.11.0/24"]

bgp_settings {
    asn                 = 65000
    bgp_peering_address = "169.254.22.2"
  }

}
