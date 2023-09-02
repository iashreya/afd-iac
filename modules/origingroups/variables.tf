variable "origin_group_name" {
  type = string
  default = "ltx1-lx"
}

variable "fd_id" {
  type = string
}

variable "origin_names" {
  type = map(string)
  default = {
    "pop-ltx1-lx" = 1,
    "pop-lva1-lx" = 1,
    "pop-lor1-lx" = 1
  }
}