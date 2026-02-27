output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_uk_id" {
  value = azurerm_virtual_network.vnet_uk.id
}

output "vnet_sa_id" {
  value = azurerm_virtual_network.vnet_sa.id
}

output "uk_subnet1_id" {
  value = azurerm_subnet.uk_subnet1.id
}

output "sa_subnet1_id" {
  value = azurerm_subnet.sa_subnet1.id
}

output "gateway_subnet_id" {
  value = azurerm_subnet.gatewaysubnet.id
}

output "vpn_gateway_id" {
  value = azurerm_virtual_network_gateway.vnet_gw.id
}

output "vpn_gateway_public_ip_1" {
  value = azurerm_public_ip.gw_pip1.ip_address
}

output "vpn_gateway_public_ip_2" {
  value = azurerm_public_ip.gw_pip2.ip_address
}

output "vpn_gateway_bgp_asn" {
  value = azurerm_virtual_network_gateway.vnet_gw.bgp_settings[0].asn
}

output "vnet_peering_sa_to_uk" {
  value = azurerm_virtual_network_peering.peer_sa_to_uk.id
}

output "vnet_peering_uk_to_sa" {
  value = azurerm_virtual_network_peering.peer_uk_to_sa.id
}

output "vpn_connection_ids" {
  value = [
    azurerm_virtual_network_gateway_connection.conn1.id,
    azurerm_virtual_network_gateway_connection.conn2.id
  ]
}