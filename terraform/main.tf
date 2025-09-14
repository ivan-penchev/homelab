locals {
  lxc_map = { for lxc in var.lxc_containers : lxc.hostname => lxc }
  vm_map  = { for vm in var.virtual_machines : vm.name => vm }
}

module "proxmox_lxc" {
  source   = "./modules/lxc"
  for_each = local.lxc_map

  target_node    = var.proxmox_node
  hostname       = each.value.hostname
  ostemplate     = each.value.ostemplate
  password       = each.value.password
  ssh_public_key = each.value.ssh_public_key
  cores          = each.value.cores
  memory         = each.value.memory
  swap           = each.value.swap
  storage        = each.value.storage
  disk_size      = each.value.disk_size
  network        = each.value.network
  tags           = each.value.tags
  start_on_boot  = each.value.start_on_boot
}

# for when proxmox_vm module is ready
# module "proxmox_vm" {
#   source = "./modules/proxmox_vm"
#   for_each = local.vm_map
#
#   # ... pass vm variables from each.value ...
# }

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tftpl", {
    lxcs = module.proxmox_lxc
  })
  filename = "${path.module}/ansible/inventory"
}