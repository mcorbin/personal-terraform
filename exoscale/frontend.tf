
resource "exoscale_instance_pool" "frontend" {
  name = "personal-frontends"
  description = "Instance Pool for my personal frontends"
  template_id = var.exoscale_template_id
  service_offering = "micro"
  network_ids = [exoscale_network.production_perso.id]
  security_group_ids = [exoscale_security_group.common.id, exoscale_security_group.frontend.id]
  size = 1
  zone = var.exoscale_zone
  key_pair = exoscale_ssh_keypair.perso.name
  user_data = data.template_cloudinit_config.config.rendered

  provisioner "local-exec" {
    command = "./pool-tag.sh ${exoscale_instance_pool.frontend.id} base,haproxy"
  }

}
