variable "origin_group_names" {
  type = map(list(object({
    name = string
    priority = number
  })))
  default = {
    ltx1-lx = [
      {name = "pop-ltx1-lx", priority = 1},
      {name = "pop-lor1-lx", priority = 2},
      {name = "pop-lva1-lx", priority = 2}
      ],
    lor1-lx = [
      {name = "pop-ltx1-lx", priority = 2},
      {name = "pop-lor1-lx", priority = 1},
      {name = "pop-lva1-lx", priority = 2}
      ], 
    lva1-lx = [
      {name = "pop-ltx1-lx", priority = 2},
      {name = "pop-lor1-lx", priority = 2},
      {name = "pop-lva1-lx", priority = 1}
      ]
  }
}

variable "custom_domains" {
  type    = list(string)
  default = ["shanand.licdn-beta.com"]
}