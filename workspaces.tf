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
      gc_size = "g1-small"           /* Google Cloud */

      dns_records = []
    }

    # Inherits defaults.
    v1   = { stage = "test", env = "wakuv1" }
    test = {
      dns_records = [
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=XLH4Z6DFDGBT36MDANNCQH3EUM l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=3fwyT4idon8DaQwRaORQ-y00faWQk8_TEzzn4DS-30ZTG0uieGDR-WFu3BJF6UAtc8Hpz8iVhVyEXLgwQYaUzwA" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "XLH4Z6DFDGBT36MDANNCQH3EUM.", dest = "enrtree-branch:37W35K6WDTQZJYYHCEUHJUT7OM,LX3OHTPYYKHLGOX45A4ZHI73XU,PPIJVI5OG6T5HO7CQK26AA3DGA" },
        { name = "PPIJVI5OG6T5HO7CQK26AA3DGA.", dest = "enr:-IS4QCdt9fr5dayFCBx9FYCfJIiHR89iVAdD9GHOcV1fglAdebrRmYRcgJw4un8kf5YCmm7Trc2uGamp3N1IRQilZ4IBgmlkgnY0gmlwhC_y0kmJc2VjcDI1NmsxoQIQJvj-KupljjSnBp2yz1PFl2SeELNwMSG68nL3Oz1SrIN0Y3CCdl8" },
        { name = "37W35K6WDTQZJYYHCEUHJUT7OM.", dest = "enr:-IS4QAmC_o1PMi5DbR4Bh4oHVyQunZblg4bTaottPtBodAhJZvxVlWW-4rXITPNg4mwJ8cW__D9FBDc9N4mdhyMqB-EBgmlkgnY0gmlwhIbRi9KJc2VjcDI1NmsxoQOevTdO6jvv3fRruxguKR-3Ge4bcFsLeAIWEDjrfaigNoN0Y3CCdl8" },
        { name = "LX3OHTPYYKHLGOX45A4ZHI73XU.", dest = "enr:-IS4QBGb7cP-S3aD8y7a7ANcbD8o-kZp9L51Erh1wlbB5R8WCVtU5PmYN71fxRJ3qO7wHNdR-HQyjdAhXh2GIVpge8kBgmlkgnY0gmlwhGia74CJc2VjcDI1NmsxoQNYImLJllfa9siWWAIjBhyX4y5S3qgLkwKJFBjzf_6ZMYN0Y3CCdl8" },
      ]
    }
    prod = {}
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
