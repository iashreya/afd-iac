resource "azurerm_cdn_frontdoor_firewall_policy" "waf" {
  name = var.waf_name
  resource_group_name = var.rg_name
  sku_name = var.waf_sku_name
  mode = var.waf_mode
}
