variable virtual_environment_endpoint {
    type        = string
    description = "Proxmox API endpoint, e.g. https://pve.example.com:8006/api2/json"
}

variable virtual_environment_token {
    type       = string
    description= "Proxmox API Token ID, e.g. user@pam!terraform"
    sensitive  = true
}

variable fusion_ha {
    description = "Config for fusion HA setup"
    type = map
    default = {
        fusion_1 = {
            vm_name        = "fusion-01"
            vm_cpu_cores   = 3
            vm_memory_size = 8192
            vm_disk_size   = 50
            vm_ipv4_address = "192.168.100.7/24"
            vm_gateway     = "192.168.100.1"
        }
        fusion_2 = {
            vm_name        = "fusion-02"
            vm_cpu_cores   = 3
            vm_memory_size = 8192
            vm_disk_size   = 50
            vm_ipv4_address = "192.168.100.8/24"
            vm_gateway     = "192.168.100.1"
        }
        kamailio = {
            vm_name        = "kamailio"
            vm_cpu_cores   = 3
            vm_memory_size = 8192
            vm_disk_size   = 50
            vm_ipv4_address = "192.168.100.9/24"
            vm_gateway     = "192.168.100.1"
        }
    }
}