data "local_file" "ssh_public_key" {
  #filename = "/root/.ssh/id_rsa.pub"
  filename = "/Users/${var.username}/.ssh/id_rsa.pub"
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "${var.node_name}"

  source_raw {
    data = <<-EOF
    #cloud-config

    users:
      - name: root
        lock_passwd: false
        passwd: "$6$ROUNDs=4096$6$ts3IZR4McgjYi3iM$RM4Fasj56JC5t8XoyQtJi8Jl7TG2GxcxHrlSk.yjxfRRvsGLuPOaWHOhMyXq3.IL7JqcwCX7qMMmwh6ZcFm/31"
        shell: /bin/bash

    ssh_pwauth: true
    disable_root: false

    chpasswd:
      expire: false

    package_update: true
    package_upgrade: true

    packages:
      - qemu-guest-agent
      - net-tools
      - curl

    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent

    EOF

    file_name = "${var.vm_name}-data-cloud-config.yaml"
  }
}