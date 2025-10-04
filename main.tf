
module "proxmox_vm" {
  source = "./modules/proxmox-vm"
  virtual_environment_endpoint       = var.virtual_environment_endpoint
  virtual_environment_token          = var.virtual_environment_token
  
  vm_name        = "jasmin-vm"
  vm_cpu_cores   = 2
  vm_memory_size = 2048
  vm_disk_size   = 20
  vm_ipv4_address = "102.22.27.150/29"
  vm_gateway     = "102.22.27.145"
  username       =  "drew"
}