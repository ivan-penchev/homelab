resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  target_node = var.target_node
  cores      = var.cores
  memory     = var.memory
  disk {
    size = var.disk_size
  }
  network_interface {
    model = "virtio"
    bridge = var.network_bridge
  }
  os_type = var.os_type
  clone   = var.clone_template
}

output "vm_id" {
  value = proxmox_vm_qemu.vm.id
}

output "vm_ip" {
  value = proxmox_vm_qemu.vm.network_interface[0].ip
}