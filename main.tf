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

module "custom_domains" {
  count    = length(var.custom_domains)
  source   = "./modules/customdomains"
  hostname = var.custom_domains[count.index]
  fd_id    = azurerm_cdn_frontdoor_profile.fd.id
}

module "origin_group" {
  for_each          = var.origin_group_names
  source            = "./modules/origingroups"
  origin_group_name = each.key
  fd_id             = azurerm_cdn_frontdoor_profile.fd.id
}
