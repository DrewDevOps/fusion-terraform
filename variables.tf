variable virtual_environment_endpoint {
    type        = string
    description = "Proxmox API endpoint, e.g. https://pve.example.com:8006/api2/json"
}

variable virtual_environment_token {
    type       = string
    description= "Proxmox API Token ID, e.g. user@pam!terraform"
    sensitive  = true
}
