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

      do_type = "s-1vcpu-1gb"        /* DigitalOcean */
      ac_type = "ecs.t5-lc1m1.small" /* Alibaba Cloud */
      gc_type = "g1-small"           /* Google Cloud */

      dns_records = []
    }

    # Inherits defaults.
    v1   = { stage = "test", env = "wakuv1" }
    test = {
      dns_records_legacy = [
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=XLH4Z6DFDGBT36MDANNCQH3EUM l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=3fwyT4idon8DaQwRaORQ-y00faWQk8_TEzzn4DS-30ZTG0uieGDR-WFu3BJF6UAtc8Hpz8iVhVyEXLgwQYaUzwA" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "XLH4Z6DFDGBT36MDANNCQH3EUM.", dest = "enrtree-branch:37W35K6WDTQZJYYHCEUHJUT7OM,LX3OHTPYYKHLGOX45A4ZHI73XU,PPIJVI5OG6T5HO7CQK26AA3DGA" },
        { name = "PPIJVI5OG6T5HO7CQK26AA3DGA.", dest = "enr:-IS4QCdt9fr5dayFCBx9FYCfJIiHR89iVAdD9GHOcV1fglAdebrRmYRcgJw4un8kf5YCmm7Trc2uGamp3N1IRQilZ4IBgmlkgnY0gmlwhC_y0kmJc2VjcDI1NmsxoQIQJvj-KupljjSnBp2yz1PFl2SeELNwMSG68nL3Oz1SrIN0Y3CCdl8" },
        { name = "37W35K6WDTQZJYYHCEUHJUT7OM.", dest = "enr:-IS4QAmC_o1PMi5DbR4Bh4oHVyQunZblg4bTaottPtBodAhJZvxVlWW-4rXITPNg4mwJ8cW__D9FBDc9N4mdhyMqB-EBgmlkgnY0gmlwhIbRi9KJc2VjcDI1NmsxoQOevTdO6jvv3fRruxguKR-3Ge4bcFsLeAIWEDjrfaigNoN0Y3CCdl8" },
        { name = "LX3OHTPYYKHLGOX45A4ZHI73XU.", dest = "enr:-IS4QBGb7cP-S3aD8y7a7ANcbD8o-kZp9L51Erh1wlbB5R8WCVtU5PmYN71fxRJ3qO7wHNdR-HQyjdAhXh2GIVpge8kBgmlkgnY0gmlwhGia74CJc2VjcDI1NmsxoQNYImLJllfa9siWWAIjBhyX4y5S3qgLkwKJFBjzf_6ZMYN0Y3CCdl8" },
      ]
      dns_records = [
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=SLJBDRNPBTM7X5RSO4WH25IDJY l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=zQ0_i4YO91B6wJ9doGoOLKb-V-stM8RdZAmnqSFtwKA8NAx6IbK-k-rRR3vrC5xzDDEFDUYCpC5--OvhKHgr8gA" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "SLJBDRNPBTM7X5RSO4WH25IDJY.", dest = "enrtree-branch:3JSK24BF37BTAFHD4PAHCWBDOY,LECZMNF5HMUHARM32YUF7RH3OE,26XUO2RSK7DWIGSTCBP4DQAH5Y" },
        { name = "3JSK24BF37BTAFHD4PAHCWBDOY.", dest = "enr:-KO4QBlzNVtUWMCNvsMkslFNSpa67cDaLXrXkMdGRddToD3jcRfEEi345NV6h56-rXO3C8oMxZ44UaZfJL10Tm7U8vMBgmlkgnY0gmlwhIbRi9KKbXVsdGlhZGRyc4wACgSG0YvSBh9A3gOJc2VjcDI1NmsxoQOevTdO6jvv3fRruxguKR-3Ge4bcFsLeAIWEDjrfaigNoN0Y3CCdl-Fd2FrdTIP" },
        { name = "LECZMNF5HMUHARM32YUF7RH3OE.", dest = "enr:-KO4QBzUhElxiM-NSjSA1B4iEkFw3_SZj-Q18jPfvruKTLy9Na3VgbUwVMFOXcvMylAB_2C6uesZJSHm99FbFqir6-0BgmlkgnY0gmlwhGia74CKbXVsdGlhZGRyc4wACgRomu-ABh9A3gOJc2VjcDI1NmsxoQNYImLJllfa9siWWAIjBhyX4y5S3qgLkwKJFBjzf_6ZMYN0Y3CCdl-Fd2FrdTIP" },
        { name = "26XUO2RSK7DWIGSTCBP4DQAH5Y.", dest = "enr:-KO4QFi0j_vwI2p4j9lPn_mCEPCx3G32ZQt1uTd8aql6chBncFQqbu5m6sW18mwpidE_Fn1U_5RrtWmqwWpVRicH9TIBgmlkgnY0gmlwhC_y0kmKbXVsdGlhZGRyc4wACgQv8tJJBh9A3gOJc2VjcDI1NmsxoQIQJvj-KupljjSnBp2yz1PFl2SeELNwMSG68nL3Oz1SrIN0Y3CCdl-Fd2FrdTIP" },
      ]
    }
    prod = {}
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
