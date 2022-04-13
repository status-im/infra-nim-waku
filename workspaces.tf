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
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=ASH2KK77DJ4HFEGIVQUUAOZD3Q l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=jb_mNdzqWiy6N496NjSQMz6R2Pt3DqqIc5o4_vZGIFxfYHeHhMejLj3fMRJfS_thWbXPftPVQmDxpCrFGZh-IwA" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "ASH2KK77DJ4HFEGIVQUUAOZD3Q.", dest = "enrtree-branch:XDJGBTC2TZPTCROQFOAFUO6L5E,HEBEZQWP7ZIDNVPHJXN4P7QADA,GNW657LRZJA7COEYYY4NYJ6TLU" },
        { name = "XDJGBTC2TZPTCROQFOAFUO6L5E.", dest = "enr:-NK4QP9Nb0sPOEZ85EFsm7brEHemAtQz0zRUlHH68E2zWtiWPbbVi7aAUA8Swe_CIFsHLQIYr8mnn9keO65Pw9ucwwwBgmlkgnY0gmlwhC_y0kmKbXVsdGlhZGRyc7g6ADg2MW5vZGUtMDEuYWMtY24taG9uZ2tvbmctYy53YWt1djIudGVzdC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhAhAm-P4q6mWONKcGnbLPU8WXZJ4Qs3AxIbrycvc7PVKsg3RjcIJ2X4V3YWt1Mg8" },
        { name = "HEBEZQWP7ZIDNVPHJXN4P7QADA.", dest = "enr:-NK4QGYl1WKxTYL3qRf_LHgvpwuOA7eUX4ZBmppDTG7pBCL4VgZiXO-J5_Dai25Mt71T--oo7NfVid5T4C1ebMdOAP4BgmlkgnY0gmlwhGia74CKbXVsdGlhZGRyc7g6ADg2MW5vZGUtMDEuZ2MtdXMtY2VudHJhbDEtYS53YWt1djIudGVzdC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhA1giYsmWV9r2yJZYAiMGHJfjLlLeqAuTAokUGPN__pkxg3RjcIJ2X4V3YWt1Mg8" },
        { name = "GNW657LRZJA7COEYYY4NYJ6TLU.", dest = "enr:-Mi4QNgb4XSvOmmjvzOpnmxZRffvqBBpND0mkoWWbacUPLRLeFvM9R07Fyjbw7lYFozdicN_QITRPXmOnUeJlR9zzs4BgmlkgnY0gmlwhIbRi9KKbXVsdGlhZGRyc7EALzYobm9kZS0wMS5kby1hbXMzLndha3V2Mi50ZXN0LnN0YXR1c2ltLm5ldAYfQN4DiXNlY3AyNTZrMaEDnr03Tuo77930a7sYLikftxnuG3BbC3gCFhA4632ooDaDdGNwgnZfhXdha3UyDw" },
      ]
    }
    prod = {
      dns_records = [
        { name = "", ttl = 60,                  dest = "enrtree-root:v1 e=6H46RFQ6PMETFLWGHNEXDQWHWA l=FDXN3SN67NA5DKA4J2GOK7BVQI seq=1 sig=MrAgKpfEeYbXCRv5p6MPPYqEgEpmhy_NlXbCUlXByxtAbgdR-py1HFYVcnEeTYjjca7U_Jy_hPUAA-psp_dftwA" },
        { name = "FDXN3SN67NA5DKA4J2GOK7BVQI.", dest = "enrtree-branch:" },
        { name = "6H46RFQ6PMETFLWGHNEXDQWHWA.", dest = "enrtree-branch:DQFS7TZNID2772ZTMP3OHCTFQA,RT5J5PK55RQN3GSELSH42DK5GQ,G2CY6SUSGLDHHRWNEVXHNJPRTA" },
        { name = "DQFS7TZNID2772ZTMP3OHCTFQA.", dest = "enr:-NK4QHk-qAIQIDDjQmtKYZJmYikTgechWNeT9Tl-tCaKsImVL-_i4p54tYUW8KBjA4F3T97A5F6Ecq8brC4vhKaXRQ4BgmlkgnY0gmlwhCJ5ZGyKbXVsdGlhZGRyc7g6ADg2MW5vZGUtMDEuZ2MtdXMtY2VudHJhbDEtYS53YWt1djIucHJvZC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhA_30kHgQqfXZRioa4J_u5asgXTJ5iw_8w3lEICH4TFu_g3RjcIJ2X4V3YWt1Mg8" },
        { name = "RT5J5PK55RQN3GSELSH42DK5GQ.", dest = "enr:-NK4QGWuLwNtQFSGUx_r_1ORLdZXCnSKX-dD1bO2QUGvz7LceTW4I4iBxrstbk7_9a7BdY5kbXr-YlhySHkEMkvNPqoBgmlkgnY0gmlwhAjS3ueKbXVsdGlhZGRyc7g6ADg2MW5vZGUtMDEuYWMtY24taG9uZ2tvbmctYy53YWt1djIucHJvZC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhAo0C-VvfgHiXrxZi3umDiooXMGY9FvYj5_d1Q4EeS7eyg3RjcIJ2X4V3YWt1Mg8" },
        { name = "G2CY6SUSGLDHHRWNEVXHNJPRTA.", dest = "enr:-Mi4QLr6Xdnrzp3imebRPr8LXuUKWablTwnXLzxGi5Q47-lYMwf4zPeGcfLy9IXXdT-PwXXv96eBS8ZunmaFlUKJ81cBgmlkgnY0gmlwhLymh5GKbXVsdGlhZGRyc7EALzYobm9kZS0wMS5kby1hbXMzLndha3V2Mi5wcm9kLnN0YXR1c2ltLm5ldAYfQN4DiXNlY3AyNTZrMaEDbl1X_zJIw3EAJGtmHMVn4Z2xhpSoUaP5ElsHKCv7hlWDdGNwgnZfhXdha3UyDw" },
      ]
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
