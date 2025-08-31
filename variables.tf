variable "vm_count" {
  description = "VM counts"
  type        = number
  default     = 3
}

variable "base_ip" {
  description = "IP static octet"
  type        = string
  default     = "192.168.110."
}

variable "start_ip" {
  description = "IP final octet started"
  type        = number
  default     = 10
}

variable "disk_path" {
  description = "Disk path machine"
  type        = string
  default     = "<DEFAULT_PATH>"
}

variable "ubuntu_24_img_url" {
  description = "Path or URL to the Ubuntu image"
  default     = "<DEFAULT_PATH>"
}