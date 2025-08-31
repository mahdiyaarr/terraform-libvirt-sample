resource "libvirt_network" "default" {
  name      = "terraform-net"
  mode      = "nat"
  domain    = "mf.local"
  addresses = ["192.168.110.0/24"]

  dhcp {
    enabled = false
  }

  autostart = true
}
