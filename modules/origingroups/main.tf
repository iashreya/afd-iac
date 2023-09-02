resource "azurerm_cdn_frontdoor_origin_group" "og" {
  name = upper(var.origin_group_name)
  cdn_frontdoor_profile_id = var.fd_id
  session_affinity_enabled = true

  health_probe {
    protocol            = "Https"
    interval_in_seconds = 5
    request_type        = "GET"
    path                = "/pop/admin"
  }

  load_balancing {
    sample_size                        = 10
    successful_samples_required        = 8
    additional_latency_in_milliseconds = 0
  }
}

module "origin" {
  for_each = var.origin_names
  source = "../origin"
  origin_name = each.key
  priority = each.value
  og_id = azurerm_cdn_frontdoor_origin_group.og.id
}