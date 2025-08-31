data "template_file" "user_data" {
  count    = var.vm_count
  template = <<EOF
#cloud-config
hostname: vm-${count.index + 1}
ssh_authorized_keys:
  - your-ssh-public-key-here
EOF
}

data "template_file" "network_config" {
  count    = var.vm_count
  template = <<EOF
version: 2
ethernets:
  ens3:
    dhcp4: no
    addresses: [${var.base_ip}${var.start_ip + count.index}/24]
    gateway4: ${var.base_ip}1
    nameservers:
      addresses: [8.8.8.8,8.8.4.4]
EOF
}

resource "libvirt_cloudinit_disk" "vm" {
  count          = var.vm_count
  name           = "vm-${count.index + 1}-cloudinit.iso"
  pool           = libvirt_pool.custom_pool.name
  user_data      = data.template_file.user_data[count.index].rendered
  network_config = data.template_file.network_config[count.index].rendered
}

resource "libvirt_volume" "os_image" {
  name   = "os_image.img"
  pool   = "images"
  source = "<DEFAULT_PATH>"
  format = "qcow2"
}
