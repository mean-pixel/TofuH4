variable "proxmox_endpoint" {
  type = string
}

variable "proxmox_api_token" {
  type      = string
  sensitive = true
}

variable "template_id" {
  default = 100
}

variable "template_node" {
  default = "PVE3"
}

variable "ssh_public_key" {
  default = "/home/itadmin/.ssh/id_ed25519.pub"
}

variable "vms" {
  type = map(object({
    node = string
    vmid = number
    cpu  = number
    ram  = number
    disk = number
  }))

  default = {
    Test-vm1 = {
      node = "PVE1"
      vmid = 600
      cpu  = 2
      ram  = 2048
      disk = 50
    }
    Test-vm2 = {
      node = "PVE2"
      vmid = 601
      cpu  = 2
      ram  = 2048
      disk = 50
    }
    Test-vm3 = {
      node = "PVE3"
      vmid = 602
      cpu  = 2
      ram  = 2048
      disk = 50
    }
    Test-vm4 = {
      node = "PVE1"
      vmid = 603
      cpu  = 4
      ram  = 4096
      disk = 100
    }
  }
}
