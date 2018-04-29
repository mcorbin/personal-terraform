provider "exoscale" {
  key = "${var.exoscale_api_key}"
  secret = "${var.exoscale_secret_key}"
}

provider "aws" {
  region     = "${var.exoscale_zone}"
}
