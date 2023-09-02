# resource "azurerm_cdn_frontdoor_origin" "origin" {
#   count = length(var.origin_names)

#   name                          = var.origin_names[count.index]
#   cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.ltx1-lx[count.index].id
#   enabled                       = true

#   certificate_name_check_enabled = false

#   host_name          = "${var.origin_names[count.index]}.www.linkedin.com"
#   origin_host_header = "${var.origin_names[count.index]}.www.linkedin.com"
#   http_port          = 80
#   https_port         = 443
#   priority           = 1
#   weight             = 50
# }