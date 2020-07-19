
resource "exoscale_network" "production_perso" {
  name             = "production-perso"
  display_text     = "My production network for my personal infra"
  zone             = "ch-gva-2"

  start_ip = "10.3.4.1"
  end_ip = "10.3.4.253"
  netmask = "255.255.255.0"
}

resource "exoscale_nlb" "personal_infra" {
  zone = "ch-gva-2"
  name = "personal-infra"
  description = "Network Load Balancer for my personal infrastructure"
}

resource "exoscale_nlb_service" "production_perso_service_main_http" {
  zone = exoscale_nlb.personal_infra.zone
  name = "production_perso_main_http"
  description = "Main service for my personal infra"
  nlb_id = exoscale_nlb.personal_infra.id
  instance_pool_id = exoscale_instance_pool.frontend.id
  protocol = "tcp"
  port = 80
  target_port = 80
  strategy = "round-robin"

  healthcheck {
    port = 80
    mode = "tcp"
    interval = 5
    timeout = 3
    retries = 1
  }
}

resource "exoscale_nlb_service" "production_perso_service_main_https" {
  zone = exoscale_nlb.personal_infra.zone
  name = "production_perso_main_https"
  description = "Main service for my personal infra"
  nlb_id = exoscale_nlb.personal_infra.id
  instance_pool_id = exoscale_instance_pool.frontend.id
  protocol = "tcp"
  port = 443
  target_port = 443
  strategy = "round-robin"

  healthcheck {
    port = 443
    mode = "tcp"
    interval = 5
    timeout = 3
    retries = 1
  }
}
