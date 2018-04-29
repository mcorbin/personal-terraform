
resource "exoscale_network" "production" {
  name = "production"
  display_text = "My production network"
  zone = "ch-dk-2"
  network_offering = "PrivNet"

}
