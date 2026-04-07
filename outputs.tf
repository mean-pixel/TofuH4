output "vm_names" {
  value = [for k, v in proxmox_virtual_environment_vm.vm : k]
}

output "vm_ips" {
  value = {
    for k, v in proxmox_virtual_environment_vm.vm :
    k => v.ipv4_addresses
  }
}
