resource "libvirt_domain" "vm" {
  count  = var.vm_count
  name   = "vm-${count.index + 1}"
  memory = 4096
  vcpu   = 2

  network_interface {
    network_name  = libvirt_network.default.name
    wait_for_lease = false
  }

  disk {
    volume_id = libvirt_volume.os_image.id
    #volume_id = libvirt_volume.vm_disk[count.index].id
  }

  cloudinit = libvirt_cloudinit_disk.vm[count.index].id
}
