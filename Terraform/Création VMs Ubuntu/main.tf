terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}


provider "proxmox" {
 
  pm_api_url = "https://192.168.1.10:8006/api2/json"
  pm_user = "root@pam"
  pm_password = "Sv650s31000!"
  # pm_api_token_id = "terraform@pam!terraform"
  # pm_api_token_secret = "﻿66091622-5711-4c42-819b-3c5ab85bd133"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "ubuntu-vm" {
  count = 2
  name  = "ubuntu-vm${count.index + 1}"
  target_node = "proxmox"
  vmid = "101${count.index + 1}"
  clone = "ubuntu-2004-init"
  agent = 1
  os_type = "cloud-init"
  cores = 1
  sockets = 1
  memory  = 1024
  scsihw  = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "10G"
    type = "scsi"
    storage = "local-lvm"
    iothread = 1
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
    firewall = false
    link_down = false
  }

  ipconfig0 = "ip=192.168.1.2${count.index + 1}/22,gw=192.168.1.1"
  # ciuser = "terraform"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

