variable "instances_count" {
  default = 1
}

variable "name" {
}

variable "zone" {
  default = "ch-dk-2"
}

variable "size" {
  default = "Micro"
}

variable "disk_size" {
  default = 10
}

variable "key_pair_name" {
}

variable "security_groups" {
  type = "list"
}

variable "image_template" {
  default = "Linux Debian 9 64-bit"
}

variable "state" {
  default = "Running"
}

variable "private_network_id" {

}

variable "ansible_groups" {
  default = ""
}

variable "ip_start" {
  default = 1
}
