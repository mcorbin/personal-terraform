

resource "exoscale_sks_cluster" "personal_k8s" {
  zone = var.exoscale_zone
  name = "personal-k8s"
  description = "Kubernetes cluster for my personal infrastructure"
  version = "1.20.5"
  service_level = "starter"
}

resource "exoscale_affinity" "sks_app_nodepool_1" {
  name = "sks-app-nodepool"
  description = "Anti affinity groups for my nodepool"
}

resource "exoscale_sks_nodepool" "apps_1" {
  zone = var.exoscale_zone
  cluster_id = exoscale_sks_cluster.personal_k8s.id
  name = "apps_1"
  description = "First nodepool for my applications"
  instance_type = "small"
  size = 3
  disk_size = 30
  security_group_ids = [exoscale_security_group.personal_sks.id]
  anti_affinity_group_ids = [exoscale_affinity.sks_app_nodepool_1.id]
}
