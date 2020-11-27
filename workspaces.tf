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

      env   = "wakuv2" /* Because we used to have wakuv1 */
      stage = terraform.workspace

      do_size = "s-1vcpu-1gb"        /* DigitalOcean */
      ac_size = "ecs.t5-lc1m1.small" /* Alibaba Cloud */
      gc_size = "n1-standard-1"      /* Google Cloud */
    }

    # Inherits defaults.
    v1     = { stage = "test", env = "wakuv1" }
    test   = { }
    prod   = { }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
