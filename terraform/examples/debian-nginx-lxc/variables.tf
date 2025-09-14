variable "lxc_name" {
  description = "The name of the LXC container"
  type        = string
}

variable "lxc_template" {
  description = "The OS template to use for the LXC container"
  type        = string
}

variable "lxc_memory" {
  description = "The amount of memory to allocate to the LXC container (in MB)"
  type        = number
  default     = 512
}

variable "lxc_cpu" {
  description = "The number of CPU cores to allocate to the LXC container"
  type        = number
  default     = 1
}

variable "lxc_network" {
  description = "The network configuration for the LXC container"
  type        = map(string)
  default     = {
    ip = "dhcp"
  }
}