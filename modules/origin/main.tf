resource "azurerm_cdn_frontdoor_origin" "origin" {
  name                          = var.origin_name
  cdn_frontdoor_origin_group_id = var.og_id
  enabled                       = true

  certificate_name_check_enabled = false

  host_name          = "${var.origin_name}.www.linkedin.com"
  origin_host_header = "${var.origin_name}.www.linkedin.com"
  http_port          = 80
  https_port         = 443
  priority           = var.priority
  weight             = 50
}
