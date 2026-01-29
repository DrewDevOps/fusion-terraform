
module "proxmox_vm" {
  source = "./modules/zeta/proxmox-vm"
  virtual_environment_endpoint       = var.virtual_environment_endpoint
  virtual_environment_token          = var.virtual_environment_token
  
  vm_name        = "bastion-node"
  vm_cpu_cores   = 1
  vm_memory_size = 2096 #8192
  vm_disk_size   = 30
  vm_ipv4_address = "102.22.27.124/29"
  # vm_ipv4_address = "192.168.100.12/24"
  vm_gateway     =  "102.22.27.121" 
  # vm_gateway     = "192.168.10.1"
  # vm_gateway     = "192.168.100.1"

  # for_each = var.fusion_ha

  # vm_name = each.value.vm_name
  # vm_cpu_cores = each.value.vm_cpu_cores
  # vm_memory_size = each.value.vm_memory_size
  # vm_disk_size = each.value.vm_disk_size
  # vm_ipv4_address = each.value.vm_ipv4_address
  # vm_gateway = each.value.vm_gateway

  username       = "drew"
  upassword       = ""
  vm_bridge      =  "vmbr0"  #WAN Network
  # vm_bridge      =  "AppsNet"  #Private IP Network
  ssh_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICMzdDSkOFpPPR5Hu2VQGGI84iyf/bKS+eyuGKNOJyhT drew@proxmox-ve"
  # ssh_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDC3RWnfaDhJmV2Be5DMdpYkzv3CTMunE/Wkm4z1t9aVGprIGm4i7TYAnjDC5VPdyBGqpbmWIe8f+m+FwTQiD3QnXrGWPeCM2vQsUUFOZwxTKmTCNkxOuDdnP4k9LBuiawzPyULtkJ19oNdQFUbaA9Sp7jiB9XxOeAGYggfkH9RPEBA1USQMBD/0lFyvI79g3G/pix1AcuSyY7Ws7GGnss+QM2+CLTYHt1VYh4ruavVAosojrs36Km+I0t38CxFfhhUzWlY6dE/NeDqnnCq7A1VEmMGyxKcIB6FkQv5WYyPHnewi02BfVl6SBKA0HsNN5lv5TZYODtO8rOTCeAvun4bXFtkLd/M2RxfFMEFALbVnLUyoM8QxvD/Ly0l9z5BB0Ugt4RtiVQYFKho3RQJ1ijgV+KjmuQZgwAfpdahO0uDJfJluXZFTiMS38NGraDIlVpiEIKNoQT4hgcw6gvBBD++8qNJ3Rlu6q5qaYmBY63v8XrY0sWMyl5YpIXAKYyAiQ9plpEI0n8Cuj0beJ7hQKjQzstF0z3OOnUu6SO/iYbvKw1Ik36ZtNW8JfQjHJ7ZgbYTlTOY+l3BYxw/9eGjDRllBUZsOOm/jKxfYruUNOJ3JKUNdM+NDNWz5MxeXD08IuYKpHQ6P0eowu5vgcrbUG1ejuBZy9GcvmzmEY3X7T9czQ== root@proxmox-ve"
}