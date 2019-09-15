provider "exoscale" {
  key    = var.exoscale_api_key
  secret = var.exoscale_secret_key
}

provider "aws" {
  version = "~> 2.16"
  region = var.exoscale_zone
  access_key = var.exoscale_api_key
  secret_key = var.exoscale_secret_key
  alias  = "gva2"

  endpoints {
    s3 = "https://sos-ch-gva-2.exo.io"
  }

  skip_credentials_validation = true
  skip_get_ec2_platforms      = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
}

