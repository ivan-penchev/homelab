output "lxc_details" {
  description = "Details of the created LXC containers."
  value = {
    for name, lxc in module.proxmox_lxc : name => {
      ip_address = lxc.ip_address
      hostname   = lxc.hostname
    }
  }
}

# output "vm_details" {
#   description = "Details of the created VMs."
#   value = {
#     for name, vm in module.proxmox_vm : name => {
#       ip_address = vm.ip_address
#       name = vm.name
#     }
#   }
# }