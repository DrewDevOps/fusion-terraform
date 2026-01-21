
module "proxmox_vm" {
  source = "./modules/zeta/proxmox-vm"
  virtual_environment_endpoint       = var.virtual_environment_endpoint
  virtual_environment_token          = var.virtual_environment_token
  
  vm_name        = "kamailio"
  vm_cpu_cores   = 4
  vm_memory_size = 8192 # 2096
  vm_disk_size   = 50
  vm_ipv4_address = "192.168.10.9/24"
  #vm_gateway     =  "102.22.27.121" 
  vm_gateway     = "192.168.10.1"
  username       = "drew"
  upassword       = ""
  # vm_bridge      =  "vmbr0"  #WAN Network
  vm_bridge      =  "AppVNet"  #Private IP Network
  ssh_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRxzocDIOyLcOT4hln0Ver2b2fJaZ4fOVAOD21GC+TWVwUridJ7gfK1VQEP4Yu0YkbJhYQ0fECEmCNbEusRcvrY4sWgV9+kjzG/7pGBwUx4m1dmfutyTAlUn1ggAU3knkiloNQbBtxPimOct8GbWF2Ewsww5KtH78OLES5g8a3DyMRF+1jfaUdCS9HeVf0IT3KY/VJmoIdD4/nDgCGwJlf6Zs0MJgUgSel5HWP+4sbbtRvF/W/CDHOG0eVsmzrnl2tdxPmopVYMlG0dgKhLHr6qDzotRunj6yxbc74BQ35vcDHkJD3hyusewfQnOlDUyFYvwC/Awqe0tl8T0Gmxt689twpkHrXKAt5sEnyBdb8azJWNsyPKCW8Xlymj6dlkaxUeneMIXnuvI1MCQ9SCNWC1EGLETYwUPZJ5Rn5ONtwxsuMaM5T9nSsOtGnnssYatZl9whbqlYYSJrDM5GFHZmhJB2Q4xbd2woiLjRknA9BAxAZZ1IDjj3j+ken5n6wrC8= drew@bastion-server"
}