
module "frontend" {
  source = "../modules/exoscale/compute"
  instances_count = 1

  name = "frontend"
  zone = "ch-dk-2"
  size = "Micro"
  disk_size = 10
  key_pair_name = "${exoscale_ssh_keypair.dell.name}"
  security_groups = ["${exoscale_security_group.common.name}", "${exoscale_security_group.frontend.name}"]
  image_template = "Linux Debian 9 64-bit"
  private_network_id = "${exoscale_network.production.id}"
  state = "Running"

  ansible_groups = "haproxy"

  ip_start = 1
}

module "tour_of_clj" {
  source = "../modules/exoscale/compute"
  instances_count = 1

  name = "tour-clj"
  zone = "ch-dk-2"
  size = "Micro"
  disk_size = 10
  key_pair_name = "${exoscale_ssh_keypair.dell.name}"
  security_groups = ["${exoscale_security_group.common.name}"]
  image_template = "Linux Debian 9 64-bit"
  private_network_id = "${exoscale_network.production.id}"
  state = "Running"

  ansible_groups = "tour-clj"
  ip_start = 10
}

module "blog" {
  source = "../modules/exoscale/compute"
  instances_count = 1

  name = "blog"
  zone = "ch-dk-2"
  size = "Micro"
  disk_size = 10
  key_pair_name = "${exoscale_ssh_keypair.dell.name}"
  security_groups = ["${exoscale_security_group.common.name}"]
  image_template = "Linux Debian 9 64-bit"
  private_network_id = "${exoscale_network.production.id}"
  state = "Running"

  ansible_groups = "blog"
  ip_start = 20
}
