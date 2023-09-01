variable "origin_group_names" {
  type = list(string)
  default = [ "ltx1-lx", "lva1-lx", "lor1-lx" ]
}

variable "origin_names" {
    type = list(string)
    default = [ "pop-ltx1-lx", "pop-lva1-lx", "pop-lor1-lx" ]
}