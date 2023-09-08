variable "waf_name" {
    type = string
    default = "fdwaf"
}

variable "rg_name" {
  type = string
}

variable "waf_sku_name" {
  type = string
  default = "Standard_AzureFrontDoor"
}

variable "waf_mode" {
  type = string
  default = "Detection"
}

variable "fd_id" {
  type = string
}

variable "ep_id" {
  type = string
}

variable "secpol_name" {
  type = string
  default = "basicwaf"
}
