variable "container_name" {
  description = "The name of the LXC container."
  type        = string
}

variable "template" {
  description = "The OS template to use for the LXC container."
  type        = string
}

variable "cores" {
  description = "Number of CPU cores for the LXC container."
  type        = number
  default     = 1
}

variable "memory" {
  description = "Amount of memory (in MB) for the LXC container."
  type        = number
  default     = 512
}

variable "disk_size" {
  description = "Size of the disk for the LXC container."
  type        = string
  default     = "8G"
}

variable "network_bridge" {
  description = "The network bridge to attach the LXC container."
  type        = string
  default     = "vmbr0"
}

variable "ip_address" {
  description = "The static IP address for the LXC container."
  type        = string
}

variable "gateway" {
  description = "The gateway for the LXC container."
  type        = string
}