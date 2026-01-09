# resource "proxmox_virtual_environment_vm" "debian_vm" {
#   name = "freeswitch"
#   node_name = "zeta"

#   clone {
#     vm_id = 9000
#     full  = true
#   }

#   disk {
#     datastore_id = "local-lvm"
#     interface    = "scsi0"
#     size         = "35"
#   }

#   network_device {
#     bridge = "vmbr0"
#     model  = "virtio"
#   }

#   initialization {
#     datastore_id = "local-lvm"
    
#     user_account {
#       username = "debian"
#       password = "yourpassword"
#     }
#     ip_config {
#       ipv4 {
#         address = "102.22.27.148/29"
#         gateway = "102.22.27.145"
#       }
#     }

#   }
# }

resource "proxmox_virtual_environment_vm" "debian_vm" {
  name       = "freeswitch-vm"
  node_name  = "zeta"
  vm_id      = 114
  started    = true

  clone {
    vm_id = 9900     # Template ID
    full  = true
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = "35"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {

    ip_config {
      ipv4 {
        address = "102.22.27.148/29"
        gateway = "102.22.27.145"
      }
    }

    dns {
      servers = ["8.8.8.8", "1.1.1.1"]
    }

    user_account {
      username = "debian"
      password = "yourpassword"
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    
  }

}
