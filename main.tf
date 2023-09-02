resource "azurerm_resource_group" "rg" {
  name     = "AFD-Test"
  location = "East US"
}

resource "azurerm_cdn_frontdoor_profile" "fd" {
  name                = "fd-test"
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "Premium_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_endpoint" "ep" {
  name                     = "fd-ep"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd.id
}

resource "azurerm_cdn_frontdoor_custom_domain" "cus_domain" {
  name                     = "fd-custom-domain"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd.id
  host_name                = "shanand.licdn-beta.com"
  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }
}

module "origin_group" {
  for_each          = var.origin_group_names
  source            = "./modules/origingroups"
  origin_group_name = each.key
  fd_id             = azurerm_cdn_frontdoor_profile.fd.id
}
