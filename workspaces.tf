/**
 * This is a hacky way of binding specific variable
 * values to different Terraform workspaces.
 *
 * Details:
 * https://github.com/hashicorp/terraform/issues/15966
 */

locals {
  env = {
    defaults = {
      hosts_count = 1 /* number of hosts in each DC */

      do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      gc_type = "g1-small"           /* Google Cloud */

      data_vol_size = 0

      dns_records = []
    }

    # Inherits defaults.
    test   = { data_vol_size = 40 }
    shards = { data_vol_size = 40 }
    prod   = { data_vol_size = 40 }
    auto   = { data_vol_size = 40 }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
