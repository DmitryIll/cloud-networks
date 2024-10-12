variable count_vm {
  default = 0
}

variable "vm" {
  type = list(
    object({
      name = string
      image = string
      cpu = number
      core_fraction = number
      ram = number
      disk_size = number
      allow_stopping   = bool
      platform = string
      zone = string
      preemptible = bool
      nat = bool
      cmd = list(string)
    })
  )
  description = "параметры ВМ"
}