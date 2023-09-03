variable "rg_name" {
  type    = string
  default = "AFD-Test"
}

variable "rg_location" {
  type    = string
  default = "East US"
}

variable "fd_name" {
  type    = string
  default = "fd-test"
}

variable "fd_sku_name" {
  type    = string
  default = "Premium_AzureFrontDoor"
}

variable "origin_group_names" {
  type = map(list(object({
    name     = string
    priority = number
  })))
  default = {
    ltx1-lx = [
      { name = "pop-ltx1-lx", priority = 1 },
      { name = "pop-lor1-lx", priority = 2 },
      { name = "pop-lva1-lx", priority = 2 }
    ],
    lor1-lx = [
      { name = "pop-ltx1-lx", priority = 2 },
      { name = "pop-lor1-lx", priority = 1 },
      { name = "pop-lva1-lx", priority = 2 }
    ],
    lva1-lx = [
      { name = "pop-ltx1-lx", priority = 2 },
      { name = "pop-lor1-lx", priority = 2 },
      { name = "pop-lva1-lx", priority = 1 }
    ]
  }
}

variable "custom_domains" {
  type    = list(string)
  default = ["shanand.licdn-beta.com"]
}

variable "waf_mode" {
  type    = string
  default = "Detection"
}

variable "waf_name" {
  type    = string
  default = "fdwaf"
}