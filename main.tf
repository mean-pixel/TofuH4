resource "proxmox_virtual_environment_vm" "vm" {
  for_each = var.vms

  name      = each.key
  node_name = each.value.node
  vm_id     = each.value.vmid

  clone {
    vm_id     = var.template_id
    node_name = var.template_node
    full      = true
  }

  cpu {
    cores = each.value.cpu
  }

  memory {
    dedicated = each.value.ram
  }

  disk {
    datastore_id = "Ceph-Storage"
    interface    = "scsi0"
    size         = each.value.disk
  }

  network_device {
    bridge = "vmbr1"
  }

  agent {
    enabled = true
  }

  initialization {
    datastore_id = "Ceph-Storage"

    user_account {
      username = "itadmin"
      keys     = [file(var.ssh_public_key)]
    }

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
