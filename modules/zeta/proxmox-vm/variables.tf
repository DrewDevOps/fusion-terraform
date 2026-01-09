variable "virtual_environment_endpoint" {
  type        = string
  description = "Proxmox API endpoint, e.g. https://pve.example.com:8006/api2/json"
}

variable "virtual_environment_token" {
  type        = string
  description = "Proxmox API Token ID, e.g. user@pam!terraform"
  sensitive   = true
}

# variable "virtual_environment_api_token_secret" {
#   type        = string
#   description = "Proxmox API Token Secret"
#   sensitive   = true
# }

variable "vm_ipv4_address" {
  type        = string
  description = "Static IPv4 address for the VM, e.g. 192.168.1.100/24"
}

variable "vm_gateway" {
  type        = string
  description = "Gateway IP address for the VM, e.g. 192.168.1.1"
}

variable "vm_name" {
  type        = string
  description = "Name of the VM to be created"
}

variable "vm_cpu_cores" {
  type        = number
  description = "Number of CPU cores for the VM"
  default     = 2
}

variable "vm_memory_size" {
  type        = number
  description = "Memory size for the VM in MB"
  default     = 2048
}

variable "vm_disk_size" {
  type        = number
  description = "Disk size for the VM in GB"
  default     = 20
}

variable "username" {
  type        = string
  description = "Username for the VM user"
}

variable "upassword" {
  type        = string
  description = "Password for the VM user"
  sensitive   = true
}

variable "vm_bridge" {
  type        = string
  description = "Network bridge for the VM"
  default     = "vmbr0"
}

variable "node_name" {
  type        = string
  description = "Proxmox node name where the VM will be created"
  default     = "proxmox-ve"
}