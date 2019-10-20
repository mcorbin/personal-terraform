module "frontend" {
  source          = "../modules/exoscale/compute"
  instances_count = 1

  name               = "frontend"
  zone               = "ch-gva-2"
  size               = "Micro"
  disk_size          = 10
  key_pair_name      = exoscale_ssh_keypair.perso.name
  security_groups    = [exoscale_security_group.common.name, exoscale_security_group.frontend.name]
  image_template     = "Linux Debian 10 (Buster) 64-bit"
  private_network_id = exoscale_network.production.id
  state              = "Running"

  ansible_groups = "haproxy,base"

  ip_start = 1
}

resource "exoscale_secondary_ipaddress" "vip" {
  count = length(module.frontend.instances_output)
  compute_id = "${module.frontend.instances_output[count.index]}"
  ip_address = "${exoscale_ipaddress.frontend_eip.ip_address}"
}

module "tour_of_clj" {
  source          = "../modules/exoscale/compute"
  instances_count = 1

  name               = "tour-clj"
  zone               = "ch-gva-2"
  size               = "Small"
  disk_size          = 10
  key_pair_name      = exoscale_ssh_keypair.perso.name
  security_groups    = [exoscale_security_group.common.name]
  image_template     = "Linux Debian 10 (Buster) 64-bit"
  private_network_id = exoscale_network.production.id
  state              = "Running"

  ansible_groups = "tour-clj,base"
  ip_start       = 10
}

module "blog" {
  source          = "../modules/exoscale/compute"
  instances_count = 1

  name               = "blog"
  zone               = "ch-gva-2"
  size               = "Small"
  disk_size          = 10
  key_pair_name      = exoscale_ssh_keypair.perso.name
  security_groups    = [exoscale_security_group.common.name]
  image_template     = "Linux Debian 10 (Buster) 64-bit"
  private_network_id = exoscale_network.production.id
  state              = "Running"

  ansible_groups = "blog,base"
  ip_start       = 20
}

