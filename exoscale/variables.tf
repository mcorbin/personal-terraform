variable "ssh_public_key_path" {
  description = "Path to the ssh public key"
  default     = "/home/mathieu/.ssh/id_rsa.pub"
}

variable "exoscale_api_key" {
  description = "Exoscale API key"
}

variable "exoscale_secret_key" {
  description = "Exoscale secret key"
}

variable "exoscale_zone" {
  description = "Exoscale zone"
  default     = "ch-gva-2"
}

variable "exoscale_template_id" {
  description = "Base template"
  default     = "c00df33a-df5b-47d2-b9c8-a2eee9ef24a3"
}

