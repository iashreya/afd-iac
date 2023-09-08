variable "origin_group_name" {
  type = string
  default = "ltx1-lx"
}

variable "fd_id" {
  type = string
}

# [{name = "pop-ltx1-lx", priority = 1},
# {name = "pop-lor1-lx", priority = 2},
# {name = "pop-lva1-lx", priority = 2}]

variable "origin_name_and_priority" {
  type = list(object({
    name = string
    priority = number
  }  ))

  default = [
    {name = "pop-ltx1-lx", priority = 1},
    {name = "pop-lor1-lx", priority = 1},
    {name = "pop-lva1-lx", priority = 1}
  ]
}
