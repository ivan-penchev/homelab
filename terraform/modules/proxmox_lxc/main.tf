resource "proxmox_lxc" "debian_container" {
  hostname = var.container_name
  ostemplate = var.template
  cores = var.cores
  memory = var.memory
  swap = var.swap
  net0 = "name=eth0,bridge=vmbr0,ip=${var.ip_address}/24,gw=${var.gateway}"
  rootfs = "${var.storage}:${var.disk_size}"

  # Optional settings
  features = var.features
  passwords = var.passwords
}

resource "null_resource" "ansible_trigger" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ${path.module}/../../ansible/inventory.tf ${path.module}/../../ansible/playbook.yml"
  }

  depends_on = [proxmox_lxc.debian_container]
}