output "frontdoor_id" {
  value = azurerm_cdn_frontdoor_profile.fd.id
}

output "endpoint_hostname" {
  value = azurerm_cdn_frontdoor_endpoint.ep.host_name
}

output "custom_domain_validation_token" {
  value = azurerm_cdn_frontdoor_custom_domain.cus_domain.validation_token
}