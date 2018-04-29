variable "ssh_private_key_path" {
  description   = "Path to the ssh private key"
  default       = "/home/mathieu/.ssh/id_rsa"
}

variable "ssh_public_key_path" {
  description   = "Path to the ssh public key"
  default       = "/home/mathieu/.ssh/id_rsa.pub"
}

variable "exoscale_api_key" {
  description   = "Exoscale API key"
}

variable "exoscale_secret_key" {
  description   = "Exoscale secret key"
}

variable "exoscale_zone" {
  description   = "Exoscale zone"
  default       = "ch-dk-2"
}
