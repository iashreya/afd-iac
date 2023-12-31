output "frontdoor_id" {
  value = azurerm_cdn_frontdoor_profile.fd.id
}

output "endpoint_hostname" {
  value = azurerm_cdn_frontdoor_endpoint.ep.host_name
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
}
