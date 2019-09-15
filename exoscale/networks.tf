resource "exoscale_network" "production" {
  name             = "production"
  display_text     = "My production network"
  zone             = "ch-gva-2"
  network_offering = "PrivNet"
}

resource "exoscale_ipaddress" "frontend_eip" {
  zone = "ch-gva-2"
  tags = {
    usage = "load-balancer"
  }
}
