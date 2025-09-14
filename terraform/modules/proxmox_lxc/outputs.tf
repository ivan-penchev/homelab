resource "proxmox_lxc" "this" {
  hostname = var.container_name
  ostemplate = var.template
  cores = var.cores
  memory = var.memory
  swap = var.swap
  net0 = var.network
}

output "container_id" {
  value = proxmox_lxc.this.id
}

output "container_ip" {
  value = proxmox_lxc.this.ip_address
}