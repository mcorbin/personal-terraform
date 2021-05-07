resource "exoscale_ssh_keypair" "perso" {
  name       = "perso"
  public_key = file(var.ssh_public_key_path)
}

# kube

resource "exoscale_security_group" "personal_sks" {
  name        = "personal-sks"
  description = "SKS security group for my personal infra"

}

resource "exoscale_security_group_rule" "nodeport_services" {
  security_group_id = exoscale_security_group.personal_sks.id
  protocol          = "TCP"
  type              = "INGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 30000
  end_port          = 32767
}

resource "exoscale_security_group_rule" "kubelet" {
  security_group_id = exoscale_security_group.personal_sks.id
  protocol          = "TCP"
  type              = "INGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 10250
  end_port          = 10250
}

resource "exoscale_security_group_rule" "calico" {
  security_group_id = exoscale_security_group.personal_sks.id
  protocol          = "UDP"
  type              = "INGRESS"
  user_security_group_id = exoscale_security_group.personal_sks.id
  start_port        = 4789
  end_port          = 4789
}

