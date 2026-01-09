terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.84.1" # x-release-please-version
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "proxmox" {
  endpoint  = var.virtual_environment_endpoint
  api_token = var.virtual_environment_token
  insecure  = true
  ssh {
    agent       = true
    username    = "root"
    private_key = file("~/.ssh/id_rsa")
  }
  
}