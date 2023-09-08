resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_cdn_frontdoor_profile" "fd" {
  name                = var.fd_name
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.fd_sku_name
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
  for_each                 = var.origin_group_names
  source                   = "./modules/origingroups"
  origin_group_name        = each.key
  origin_name_and_priority = each.value
  fd_id                    = azurerm_cdn_frontdoor_profile.fd.id
}

module "waf" {
  source       = "./modules/waf"
  waf_name     = var.waf_name
  rg_name      = azurerm_resource_group.rg.name
  waf_sku_name = azurerm_cdn_frontdoor_profile.fd.sku_name
  waf_mode     = var.waf_mode
  fd_id        = azurerm_cdn_frontdoor_profile.fd.id
  ep_id        = azurerm_cdn_frontdoor_endpoint.ep.id
}
