variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_memory" {
  description = "The amount of memory (in MB) allocated to the VM."
  type        = number
}

variable "vm_cpu" {
  description = "The number of CPU cores allocated to the VM."
  type        = number
}

variable "vm_disk_size" {
  description = "The size of the disk for the VM (in GB)."
  type        = number
}

variable "vm_network" {
  description = "The network configuration for the VM."
  type        = map(string)
}

variable "os_type" {
  description = "The operating system type for the VM."
  type        = string
}

variable "iso_image" {
  description = "The ISO image to use for the VM installation."
  type        = string
}