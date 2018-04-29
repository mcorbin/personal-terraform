
resource "exoscale_compute" "instance"  {
  count = "${var.instances_count}"

  display_name = "${var.name}-${count.index}"
  template = "${var.image_template}"
  state = "${var.state}"

  zone = "${var.zone}"

  size = "Micro"
  disk_size = 10
  key_pair = "${var.key_pair_name}"
  security_groups = ["${var.security_groups}"]
  tags {
    ansible_groups = "${var.ansible_groups}"
  }

  user_data = "${element(data.template_cloudinit_config.config.*.rendered, count.index)}"

}

resource "exoscale_nic" "eth_intra" {
  count = "${var.instances_count}"

  compute_id = "${exoscale_compute.instance.*.id[count.index]}"
  network_id = "${var.private_network_id}"
}
