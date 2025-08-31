resource "libvirt_pool" "custom_pool" {
  name = "terraform_pool"
  type = "dir"
  path = var.disk_path
}

resource "libvirt_volume" "vm_disk" {
  count  = var.vm_count
  name   = "vm-${count.index + 1}.qcow2"
  pool   = libvirt_pool.custom_pool.name
  size   = 20 * 1024 * 1024 * 1024 # 20 GB
  format = "qcow2"
}
