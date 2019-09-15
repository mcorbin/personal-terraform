data "template_file" "init" {
  template = file("${path.module}/templates/cloud.yml")
  count    = var.instances_count

  vars = {
    hostname   = "${var.name}-${count.index}"
    ip_address = "10.3.4.${format("%d", var.ip_start + count.index)}"
  }
}

data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  count = var.instances_count

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = element(data.template_file.init.*.rendered, count.index)
  }
}

