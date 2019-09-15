terraform {
  backend "s3" {
    bucket   = "mcorbin-websites-tf"
    key    = "mcorbin.tfstate"
    region = "ch-gva-2"

    endpoint = "https://sos-ch-gva-2.exo.io"

    # Deactivate the AWS specific behaviours
    #
    # https://www.terraform.io/docs/backends/types/s3.html#skip_credentials_validation
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true

  }
}

