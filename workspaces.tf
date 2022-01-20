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
      dns_records = [
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=SLJBDRNPBTM7X5RSO4WH25IDJY l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=zQ0_i4YO91B6wJ9doGoOLKb-V-stM8RdZAmnqSFtwKA8NAx6IbK-k-rRR3vrC5xzDDEFDUYCpC5--OvhKHgr8gA" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "SLJBDRNPBTM7X5RSO4WH25IDJY.", dest = "enrtree-branch:3JSK24BF37BTAFHD4PAHCWBDOY,LECZMNF5HMUHARM32YUF7RH3OE,26XUO2RSK7DWIGSTCBP4DQAH5Y" },
        { name = "3JSK24BF37BTAFHD4PAHCWBDOY.", dest = "enr:-KO4QBlzNVtUWMCNvsMkslFNSpa67cDaLXrXkMdGRddToD3jcRfEEi345NV6h56-rXO3C8oMxZ44UaZfJL10Tm7U8vMBgmlkgnY0gmlwhIbRi9KKbXVsdGlhZGRyc4wACgSG0YvSBh9A3gOJc2VjcDI1NmsxoQOevTdO6jvv3fRruxguKR-3Ge4bcFsLeAIWEDjrfaigNoN0Y3CCdl-Fd2FrdTIP" },
        { name = "LECZMNF5HMUHARM32YUF7RH3OE.", dest = "enr:-KO4QBzUhElxiM-NSjSA1B4iEkFw3_SZj-Q18jPfvruKTLy9Na3VgbUwVMFOXcvMylAB_2C6uesZJSHm99FbFqir6-0BgmlkgnY0gmlwhGia74CKbXVsdGlhZGRyc4wACgRomu-ABh9A3gOJc2VjcDI1NmsxoQNYImLJllfa9siWWAIjBhyX4y5S3qgLkwKJFBjzf_6ZMYN0Y3CCdl-Fd2FrdTIP" },
        { name = "26XUO2RSK7DWIGSTCBP4DQAH5Y.", dest = "enr:-KO4QFi0j_vwI2p4j9lPn_mCEPCx3G32ZQt1uTd8aql6chBncFQqbu5m6sW18mwpidE_Fn1U_5RrtWmqwWpVRicH9TIBgmlkgnY0gmlwhC_y0kmKbXVsdGlhZGRyc4wACgQv8tJJBh9A3gOJc2VjcDI1NmsxoQIQJvj-KupljjSnBp2yz1PFl2SeELNwMSG68nL3Oz1SrIN0Y3CCdl-Fd2FrdTIP" },
      ]
    }
    prod = {
      dns_records = [
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=2FPT7YBR4ZHGPTSEDRD5D6N7MU l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=6fuJ5SvsUX_9se681PVe2ZToyTfkm6WHTD9hoy3RhFtDMTD2ZvxgJ3V1283aFhBsftch0T3UvKohWM404A7eIgE" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "2FPT7YBR4ZHGPTSEDRD5D6N7MU.", dest = "enrtree-branch:MFAJGGC6CLWF6CXCR2V6CNED7Q,QHKIV5TAXBC6N24HILY7ASGSFU,WTAZHIHIXAEAFB4KVC7SNBIFLU" },
        { name = "MFAJGGC6CLWF6CXCR2V6CNED7Q.", dest = "enr:-Iu4QJUcYA1ULMF9UfwOZBLNPT0dSxrVtGRws6KhE9b3WH9IS-1gAfTSzJjm30gp3Wz46upPJbdarGOIZTNlG3k_n0YBgmlkgnY0gmlwhAjS3ueJc2VjcDI1NmsxoQKNAvlb34B4l68WYt7pg4qKFzBmPRb2I-f3dUOBHku3soN0Y3CCdl-Fd2FrdTIP" },
        { name = "QHKIV5TAXBC6N24HILY7ASGSFU.", dest = "enr:-Iu4QALmEco5FZq1DDf3egW27AJ6YSg4Rpdp3RJxQlLQbdrNDxsYJXIVH8ZUh346EVOldWhxr8zoiyfBwJPDgPoNoOsBgmlkgnY0gmlwhLymh5GJc2VjcDI1NmsxoQNuXVf_MkjDcQAka2YcxWfhnbGGlKhRo_kSWwcoK_uGVYN0Y3CCdl-Fd2FrdTIP" },
        { name = "WTAZHIHIXAEAFB4KVC7SNBIFLU.", dest = "enr:-Iu4QE2RvpRiwWwoCf-EkwCx25_ftH5VOiv67bp2gO1qzi6yKzYMV3ZrG4JDEOyJuZs5miH-nRtM3r48ksb6QL2gvWYBgmlkgnY0gmlwhCJ5ZGyJc2VjcDI1NmsxoQP99JB4EKn12UYqGuCf7uWrIF0yeYsP_MN5RCAh-Exbv4N0Y3CCdl-Fd2FrdTIP" },
      ]
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
