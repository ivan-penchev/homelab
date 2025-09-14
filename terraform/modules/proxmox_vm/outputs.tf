resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  cores       = var.vm_cores
  memory      = var.vm_memory
  disk {
    size = var.vm_disk_size
  }
  network_interface {
    model = "virtio"
    bridge = var.vm_network_bridge
  }
}

output "vm_id" {
  value = proxmox_vm_qemu.vm.id
}

output "vm_ip" {
  value = proxmox_vm_qemu.vm.network_interface[0].ip
}