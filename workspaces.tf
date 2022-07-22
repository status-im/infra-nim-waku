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

      do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      gc_type = "g1-small"           /* Google Cloud */

      dns_records = []
    }

    # Inherits defaults.
    v1   = { stage = "test", env = "wakuv1" }
    test = {
      dns_records = [
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=6MRD3IKZEE5COX7TYBUZC5L4MU l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=bYCHTQ7V7QQbfhgS9rQKgroExOlq9re5WjGV_3YrAF8NnWCRPy9IXtulvlEtijXkk8sw9yEGPFDKEYzkeCLWUAA" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "6MRD3IKZEE5COX7TYBUZC5L4MU.", dest = "enrtree-branch:EGF7DJ6CEODMEBFE2UF7XQOAAI,OJSLBZJ7KBWLZ4YE6YWKL2DZI4,WF4LISPXF3QRMZUOIULLVLX6M4" },
        { name = "EGF7DJ6CEODMEBFE2UF7XQOAAI.", dest = "enr:-Nm4QC0_ClHzbsutYzgT3jJm7ZY1D4shylAdd6Ac-L4uwAUha1oHM0zwoEkTORVt94W5Cpa0IiyrTcXAYLgpRXpVNUsBgmlkgnY0gmlwhC_y0kmKbXVsdGlhZGRyc7g6ADg2MW5vZGUtMDEuYWMtY24taG9uZ2tvbmctYy53YWt1djIudGVzdC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhAhAm-P4q6mWONKcGnbLPU8WXZJ4Qs3AxIbrycvc7PVKsg3RjcIJ2X4N1ZHCCIyiFd2FrdTIP" },
        { name = "OJSLBZJ7KBWLZ4YE6YWKL2DZI4.", dest = "enr:-Nm4QLHYoJ5WYQoVzyqPR-pwIeQvi3ONWs-EPwk3uUiBiDseN9Dd7fYbCvkMdeXcuZ-8U9IYdGm38VxSDf_Oq3zZ0cEBgmlkgnY0gmlwhGia74CKbXVsdGlhZGRyc7g6ADg2MW5vZGUtMDEuZ2MtdXMtY2VudHJhbDEtYS53YWt1djIudGVzdC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhA1giYsmWV9r2yJZYAiMGHJfjLlLeqAuTAokUGPN__pkxg3RjcIJ2X4N1ZHCCIyiFd2FrdTIP" },
        { name = "WF4LISPXF3QRMZUOIULLVLX6M4.", dest = "enr:-M-4QCtJKX2WDloRYDT4yjeMGKUCRRcMlsNiZP3cnPO0HZn6IdJ035RPCqsQ5NvTyjqHzKnTM6pc2LoKliV4CeV0WrgBgmlkgnY0gmlwhIbRi9KKbXVsdGlhZGRyc7EALzYobm9kZS0wMS5kby1hbXMzLndha3V2Mi50ZXN0LnN0YXR1c2ltLm5ldAYfQN4DiXNlY3AyNTZrMaEDnr03Tuo77930a7sYLikftxnuG3BbC3gCFhA4632ooDaDdGNwgnZfg3VkcIIjKIV3YWt1Mg8" },
      ]
    }
    prod = {
      dns_records = [
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=7SYXFJTTXRNO22MND7OB63DOJM l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=r2Gw3QQ1TmYEou0jevxl7fjYkf__SclEQsp1_sQNidVWX0s4xgwFCMcIM1K-4kyt0xqiw_xiXBSw_yAsowH4lQA" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "7SYXFJTTXRNO22MND7OB63DOJM.", dest = "enrtree-branch:J3EAPX7UXJG3PZOFWYXG6HAOHU,ICHVQP6RKGHSSCG6IJHFIPTCWE,DUSWQSJUOBVM6CGRIVKE7TOWVQ" },
        { name = "J3EAPX7UXJG3PZOFWYXG6HAOHU.", dest = "enr:-Nm4QNgc2L6L-4nk6jgllNDE1QDcn6kv2922rTRYs1wM3My_OmSsTimkMCIMh8fat6enFdYfuJ23KjWdF5whBz3zXgUBgmlkgnY0gmlwhCJ5ZGyKbXVsdGlhZGRyc7g6ADg2MW5vZGUtMDEuZ2MtdXMtY2VudHJhbDEtYS53YWt1djIucHJvZC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhA_30kHgQqfXZRioa4J_u5asgXTJ5iw_8w3lEICH4TFu_g3RjcIJ2X4N1ZHCCIyiFd2FrdTIP" },
        { name = "ICHVQP6RKGHSSCG6IJHFIPTCWE.", dest = "enr:-Nm4QOdTOKZJKTUUZ4O_W932CXIET-M9NamewDnL78P5u9DOGnZlK0JFZ4k0inkfe6iY-0JAaJVovZXc575VV3njeiABgmlkgnY0gmlwhAjS3ueKbXVsdGlhZGRyc7g6ADg2MW5vZGUtMDEuYWMtY24taG9uZ2tvbmctYy53YWt1djIucHJvZC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhAo0C-VvfgHiXrxZi3umDiooXMGY9FvYj5_d1Q4EeS7eyg3RjcIJ2X4N1ZHCCIyiFd2FrdTIP" },
        { name = "DUSWQSJUOBVM6CGRIVKE7TOWVQ.", dest = "enr:-M-4QLdAB-KyzT3QEsDoNa4LXT6RGH9BIylvTlDFLQhigWmxKEesulgc8AoKmVEUKj_4St6ThBKwyBc69tBfCe2hVTABgmlkgnY0gmlwhLymh5GKbXVsdGlhZGRyc7EALzYobm9kZS0wMS5kby1hbXMzLndha3V2Mi5wcm9kLnN0YXR1c2ltLm5ldAYfQN4DiXNlY3AyNTZrMaEDbl1X_zJIw3EAJGtmHMVn4Z2xhpSoUaP5ElsHKCv7hlWDdGNwgnZfg3VkcIIjKIV3YWt1Mg8" },
      ]
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
