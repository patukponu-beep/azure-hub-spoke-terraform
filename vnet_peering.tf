#CREATING VIRTUAL NETWORK PEERING

#PEERING 1: UK-TO-SA( TRANSIT (HUB) NETWORK )

resource "azurerm_virtual_network_peering" "peer_uk_to_sa" {
    name = "uk-to-sa"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet_uk.name
    remote_virtual_network_id = azurerm_virtual_network.vnet_sa.id

    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit = true
    use_remote_gateways = false

    depends_on = [
    azurerm_virtual_network_gateway.vnet_gw
  ]

}

#PEERING 2: SA-TO-UK( SPOKE NETWORK )

resource "azurerm_virtual_network_peering" "peer_sa_to_uk" {
    name = "sa-to-uk"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet_sa.name
    remote_virtual_network_id = azurerm_virtual_network.vnet_uk.id

    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit = false
    use_remote_gateways =   true

    depends_on = [
    azurerm_virtual_network_peering.peer_uk_to_sa,
    azurerm_virtual_network_gateway.vnet_gw
  ]

}