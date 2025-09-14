variable "proxmox_api_token_secret" {
  description = "The secret for the Proxmox API token."
  type        = string
  sensitive   = true
}

variable "lxc_containers" {
  description = "A list of LXC container configurations to create."
  type = list(object({
    hostname       = string
    ostemplate     = string
    password       = optional(string)
    ssh_public_key = optional(string)
    cores          = optional(number, 1)
    memory         = optional(number, 512)
    swap           = optional(number, 512)
    storage        = string
    disk_size      = optional(string, "8G")
    network = object({
      name   = string
      bridge = string
      ip     = optional(string, "dhcp")
      gw     = optional(string)
    })
    tags          = optional(list(string), [])
    start_on_boot = optional(bool, true)
  }))
  default = []
}

variable "virtual_machines" {
  description = "A list of virtual machine configurations to create."
  type = list(object({
    name           = string
    clone          = string
    cores          = optional(number, 1)
    sockets        = optional(number, 1)
    memory         = optional(number, 2048)
    storage        = string
    disk_size      = optional(string, "32G")
    network = object({
      model  = string
      bridge = string
    })
    ipconfig0      = optional(string)
    tags           = optional(list(string), [])
    start_on_boot  = optional(bool, true)
    ciuser         = optional(string)
    cipassword     = optional(string)
    sshkeys        = optional(string)
  }))
  default = []
}