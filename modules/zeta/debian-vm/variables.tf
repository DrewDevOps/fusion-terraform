variable "virtual_environment_endpoint" {
  type        = string
  description = "Proxmox API endpoint, e.g. https://pve.example.com:8006/api2/json"
}

variable "virtual_environment_token" {
  type        = string
  description = "Proxmox API Token ID, e.g. user@pam!terraform"
  sensitive   = true
}

variable "vm_name" {
  type        = string
  description = "Name of the VM to be created"
  default     = "freeswitch-vm"
}

variable "username" {
  type        = string
  description = "Username for the VM user"
}