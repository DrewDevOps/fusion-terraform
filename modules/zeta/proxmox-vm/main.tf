resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name      = var.vm_name
  node_name = var.node_name
  # tags = [ "proxy", "development", "bastion-server" ]
  # tags = [ "AppServer", "development", "Fish"]
  tags = ["PBX", "AppNetWk", "Private", "SIP", "Proxy"]

  agent {
    enabled = true
  }

  cpu {
    cores = var.vm_cpu_cores
  }

  memory {
    dedicated = var.vm_memory_size
  }

  disk {
    datastore_id = "local-lvm"
    # file_id      = "local:iso/jammy-server-cloudimg-amd64.img" #"local:iso/pfSense-CE-2.6.0-RELEASE-amd64.img" #
    file_id      = "local:iso/debian-12.0.0-amd64-netinst.iso"
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.vm_disk_size
  }

  initialization {
    # uncomment and specify the datastore for cloud-init disk if default `local-lvm` is not available
    # datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        # address = "dhcp"
        address = var.vm_ipv4_address #"102.22.27.147/24"
        gateway = var.vm_gateway 
      }
    }

    dns {
      servers = ["8.8.8.8", "1.1.1.1"]
    }
    # user_account {
    #   username = "ubuntu" 
    #   password = "test" 
    # }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
  }

  network_device {
    bridge = var.vm_bridge
  }
  

}