resource "azurerm_cdn_frontdoor_origin_group" "ltx1-lx" {
  count = length(var.origin_group_names)

  name = upper(var.origin_group_names[count.index])
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd.id
  session_affinity_enabled = true

  health_probe {
    protocol = "Https"
    interval_in_seconds = 5
    request_type = "GET"
    path = "/pop/admin"
  }

  load_balancing {
    sample_size = 10
    successful_samples_required = 8
    additional_latency_in_milliseconds = 0
  }
}

resource "azurerm_cdn_frontdoor_origin" "origin" {
  count = length(var.origin_names)

  name = "${var.origin_names[count.index]}"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.ltx1-lx[count.index].id
  enabled = true

  certificate_name_check_enabled = false

  host_name = "${var.origin_names[count.index]}.www.linkedin.com"
  origin_host_header = "${var.origin_names[count.index]}.www.linkedin.com"
  http_port = 80
  https_port = 443
  priority = 1
  weight = 50
}