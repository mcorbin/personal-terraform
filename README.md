# My infrastructure

This terraform configuration deploys the infrastructure for my personal websites (mcorbin.fr, tour.mcorbin.fr, meuse.mcorbin.fr...) on Exoscale (https://www.exoscale.com/)

## How to use

Source this file:

```
export TF_VAR_exoscale_api_key=<your key>
export TF_VAR_exoscale_secret_key=<tour secret>

export AWS_ACCESS_KEY_ID=${TF_VAR_exoscale_api_key}
export AWS_SECRET_ACCESS_KEY=${TF_VAR_exoscale_secret_key}
```

## Modules

### compute

This module creates Exoscale instances in a private network. You can read the `variables.tf` file for configuration.
