resource "exoscale_ssh_keypair" "perso" {
  name       = "perso"
  public_key = file(var.ssh_public_key_path)
}

# common

resource "exoscale_security_group" "common" {
  name        = "common"
  description = "Common security group"

}

resource "exoscale_security_group_rule" "ssh_in" {
  security_group_id = exoscale_security_group.common.id
  protocol          = "TCP"
  type              = "INGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 22
  end_port          = 22
}

resource "exoscale_security_group_rule" "http_out" {
  security_group_id = exoscale_security_group.common.id
  protocol          = "TCP"
  type              = "EGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 80
  end_port          = 80
}

resource "exoscale_security_group_rule" "https_out" {
  security_group_id = exoscale_security_group.common.id
  protocol          = "TCP"
  type              = "EGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 443
  end_port          = 443
}

# frontend

resource "exoscale_security_group" "frontend" {
  name        = "frontend"
  description = "Frontend security group"

}

resource "exoscale_security_group_rule" "http_in" {
  security_group_id = exoscale_security_group.frontend.id
  protocol          = "TCP"
  type              = "INGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 80
  end_port          = 80
}

resource "exoscale_security_group_rule" "https_in" {
  security_group_id = exoscale_security_group.frontend.id
  protocol          = "TCP"
  type              = "INGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 443
  end_port          = 443
}

