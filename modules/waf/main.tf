resource "azurerm_cdn_frontdoor_firewall_policy" "waf" {
  name = var.waf_name
  resource_group_name = var.rg_name
  sku_name = var.waf_sku_name
  mode = var.waf_mode
  enabled = false
}

resource "azurerm_cdn_frontdoor_security_policy" "secpol" {
  name = var.secpol_name
  cdn_frontdoor_profile_id = var.fd_id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = azurerm_cdn_frontdoor_firewall_policy.waf.id
      association {
        domain {
          cdn_frontdoor_domain_id = var.ep_id
        }
        patterns_to_match = ["/*"]
      }
    }
  }
}
