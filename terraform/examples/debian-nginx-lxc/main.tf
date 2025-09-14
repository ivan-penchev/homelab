resource "proxmox_lxc" "debian_nginx" {
  hostname = var.container_name
  template = var.template
  storage  = var.storage
  cores    = var.cores
  memory   = var.memory
  swap     = var.swap

  network {
    name = "eth0"
    bridge = var.network_bridge
    ip = var.ip_address
    gw = var.gateway
  }

  ssh_public_keys = [file(var.ssh_public_key_path)]
}

output "lxc_id" {
  value = proxmox_lxc.debian_nginx.id
}

output "lxc_ip" {
  value = proxmox_lxc.debian_nginx.network[0].ip
}

resource "null_resource" "ansible_trigger" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ${path.module}/../../ansible/inventory.tf ${path.module}/../../ansible/playbook.yml"
  }

  depends_on = [proxmox_lxc.debian_nginx]
}