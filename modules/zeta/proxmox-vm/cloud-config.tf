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

    hostname: "${var.vm_name}"
    manage_etc_hosts: true

    users:
      - default
      - name: "${var.username}"
        groups: sudo
        lock_passwd: false
        shell: /bin/bash
        sudo: ALL=(ALL) NOPASSWD:ALL
        ssh_authorized_keys:
          - "${var.ssh_keys}"

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