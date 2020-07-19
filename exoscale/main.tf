module "tour_of_clj" {
  source          = "../modules/exoscale/compute"
  instances_count = 1

  name               = "tour-clj"
  zone               = "ch-gva-2"
  size               = "Small"
  disk_size          = 10
  key_pair_name      = exoscale_ssh_keypair.perso.name
  security_groups    = [exoscale_security_group.common.name]
  image_template_id  = var.exoscale_template_id
  private_network_id = exoscale_network.production_perso.id
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
  image_template_id  = var.exoscale_template_id
  private_network_id = exoscale_network.production_perso.id
  state              = "Running"

  ansible_groups = "blog,base"
  ip_start       = 20
}

