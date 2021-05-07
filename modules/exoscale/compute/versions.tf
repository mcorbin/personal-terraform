
terraform {
  required_version = ">= 0.13"
  required_providers {
    exoscale = {
      source = "exoscale/exoscale"
    }
    template = {
      source = "hashicorp/template"
    }
  }
}
