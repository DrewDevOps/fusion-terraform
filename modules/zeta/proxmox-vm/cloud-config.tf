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
      - default
      - name: root
        groups: sudo
        lock_passwd: false
        shell: /bin/bash
        sudo: ALL=(ALL) NOPASSWD:ALL
        ssh_authorized_keys:
          - "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCTNS8HNyyGbEs27EnDh8NdPBKkdP5mDO9NZtgRDnw/7Edu5YLgTRoum81WyB9zrNhE+xnNpjHD5f6QBQlxYYHMQbYZzsI52kHfrTKmJ7UFDrkB3HzJR3x0uC6pyIB7czFExeoudXweSoXbsECWIPMIyJZdfugRTF31YMYkI04wrpntYTetdzOXG1pdToeLivx6aOSrAIxPitKJUKB3TQxDR9xxjoNcrq+Yob7hFLVUVYnAWxNjyF6q08n4pffuaWF9K197CH2aLPDMHiC6NOG8o6LoFaBn68bpfD+E2XmxeioRj+j3DO4sjpDDL+jNGDnfJLTsUaIlwRKwD5AEcQpMYlqs0TGFO9eDDBAqRrUS4JF1JNCmGPSfn99JxC43qABK16u63el3baVXIRH8UXkUHNxoF09GHONKXmLqk5hBlJiyqgkFF1Hd7mJ8ImHlqsNKtWCTEgjH0U+oLAUe4bst5eiOTCjC/HmnhoC5qFoO4F4+Um60QgOFvOISdjGH7DIvfJXdoNeV/o8O/qeC7gRv9Fw2hNawwuMkMJJ533pP6PpPm/FkzLbSnpaU1goxNyxEoPUw3QTlKApRYi0AXaGgyhgfTCiE1tjsVJanEZft7WdcROsekxC8v4FNOJe1ZcZH6wxT2ashiXQnUutSfCl9+tf0oYj1vrM+7Fqmu3hQkw== root@proxmox-ve"

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