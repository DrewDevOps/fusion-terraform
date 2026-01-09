resource "proxmox_virtual_environment_vm" "debian_vm" {
  name       = var.vm_name
  node_name  = "ISpve2"
  vm_id      = 109
  started    = true

  clone {
    vm_id = 156     # Template ID
    full  = true
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = "60"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {

    ip_config {
      ipv4 {
        address = "${var.vm_ipv4_address}/24"
        gateway = var.vm_gateway 
      }
    }

    dns {
      servers = ["8.8.8.8", "1.1.1.1"]
    }

    user_account {
      username = "debian"
      password = "yourpassword"
    }

    #user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    
  }

}
