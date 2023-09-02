variable "origin_group_names" {
  type = map(string)
  default = {
    ltx1-lx = "pop-ltx1-lx",
    lva1-lx = "pop-lva1-lx",
    lor1-lx = "pop-lor1-lx"
  }
}

variable "custom_domains" {
  type    = list(string)
  default = ["shanand.licdn-beta.com"]
}