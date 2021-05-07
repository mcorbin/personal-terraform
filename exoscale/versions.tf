
terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    exoscale = {
      source = "exoscale/exoscale"
    }
    template = {
      source = "hashicorp/template"
    }
  }
}
