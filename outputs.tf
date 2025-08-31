output "vm_ips" {
  value = [
    for idx in range(var.vm_count) :
    "${var.base_ip}${var.start_ip + idx}"
  ]
}
