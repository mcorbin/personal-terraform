variable "instances_count" {
  default = 1
}

variable "name" {
}

variable "zone" {
  default = "ch-gva-2"
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
  type = list(string)
}

variable "image_template_id" {
  default = "b7ce66da-8bd1-4a02-8788-0bd880038b01"
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

output "instances_output" {
  value = exoscale_compute.instance.*.id
}
