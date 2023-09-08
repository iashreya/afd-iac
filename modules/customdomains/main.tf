resource "azurerm_cdn_frontdoor_custom_domain" "cus_domain" {
  name                     = "fd-custom-domain"
  cdn_frontdoor_profile_id = var.fd_id
  host_name                = var.hostname
  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }
}
