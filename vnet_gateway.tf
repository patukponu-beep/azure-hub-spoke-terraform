#CREATING A VIRTUAL NETWORK GATEWAY

resource "azurerm_virtual_network_gateway" "vnet_gw" {
    name = "vnet-gw"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location

    type = "Vpn"
    vpn_type = "RouteBased"
    sku = "VpnGw2AZ"
    generation = "Generation2"

    active_active = true
    enable_bgp = true

ip_configuration {
    name = "vnet-gw-ipconfig1"
    public_ip_address_id = azurerm_public_ip.gw_pip1.id  
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.gatewaysubnet.id
    }

ip_configuration {
    name                          = "vnet-gw-ipconfig2"
    public_ip_address_id          = azurerm_public_ip.gw_pip2.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gatewaysubnet.id
  }

bgp_settings {
    asn         = 65015

    peering_addresses {
      ip_configuration_name = "vnet-gw-ipconfig1"
      apipa_addresses       = ["169.254.21.1"]
    }
    peering_addresses {
      ip_configuration_name = "vnet-gw-ipconfig2"
      apipa_addresses       = ["169.254.22.1"]
    }
  }
}