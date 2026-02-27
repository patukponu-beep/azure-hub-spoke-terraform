#Common custom IPsec policy (IKEv2)
locals {
  s2s_ipsec_policy = {
    ike_encryption   = "AES256"
    ike_integrity    = "SHA256"
    dh_group         = "DHGroup14"

    ipsec_encryption = "AES256"
    ipsec_integrity  = "SHA256"
    pfs_group        = "PFS14"

    sa_lifetime_sec  = 28800

  }
}


#Connection 1 with custom policy

resource "azurerm_virtual_network_gateway_connection" "conn1" {
  name                = "conn-azure-to-onprem-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type                      = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vnet_gw.id
  local_network_gateway_id   = azurerm_local_network_gateway.ln_gw1.id

  shared_key = "MyStrongPassword!"
  enable_bgp = true

  ipsec_policy {
    ike_encryption   = local.s2s_ipsec_policy.ike_encryption
    ike_integrity    = local.s2s_ipsec_policy.ike_integrity
    dh_group         = local.s2s_ipsec_policy.dh_group

    ipsec_encryption = local.s2s_ipsec_policy.ipsec_encryption
    ipsec_integrity  = local.s2s_ipsec_policy.ipsec_integrity
    pfs_group        = local.s2s_ipsec_policy.pfs_group

    sa_lifetime = local.s2s_ipsec_policy.sa_lifetime_sec
   
  }
}

#Connection 2 with same custom policy
resource "azurerm_virtual_network_gateway_connection" "conn2" {
  name                = "conn-azure-to-onprem-2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type                      = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vnet_gw.id
  local_network_gateway_id   = azurerm_local_network_gateway.ln_gw2.id

  shared_key = var.shared_key
  enable_bgp = true

  ipsec_policy {
    ike_encryption   = local.s2s_ipsec_policy.ike_encryption
    ike_integrity    = local.s2s_ipsec_policy.ike_integrity
    dh_group         = local.s2s_ipsec_policy.dh_group

    ipsec_encryption = local.s2s_ipsec_policy.ipsec_encryption
    ipsec_integrity  = local.s2s_ipsec_policy.ipsec_integrity
    pfs_group        = local.s2s_ipsec_policy.pfs_group

    sa_lifetime= local.s2s_ipsec_policy.sa_lifetime_sec
  }
}