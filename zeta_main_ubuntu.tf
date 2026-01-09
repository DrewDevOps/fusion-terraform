
module "proxmox_vm" {
  source = "./modules/zeta/proxmox-vm"
  virtual_environment_endpoint       = var.virtual_environment_endpoint
  virtual_environment_token          = var.virtual_environment_token
  
  vm_name        = "app-server-02"
  vm_cpu_cores   = 1
  vm_memory_size = 2048
  vm_disk_size   = 25
  vm_ipv4_address = "192.168.10.14/24"
  vm_gateway     =  "192.168.10.1"
  username       = "drew"
  upassword       = "pwds"
  vm_bridge      =  "AppNetWk"

}