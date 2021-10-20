module "hosts" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  env    = local.ws.env
  stage  = local.ws.stage
  group  = "${local.ws.env}-${local.ws.stage}"
  domain = var.domain

  /* scaling */
  host_count = local.ws["hosts_count"]

  /* instance sizes */
  do_type = local.ws["do_type"] /* DigitalOcean */
  ac_type = local.ws["ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["gc_type"] /* Google Cloud */

  /* firewall */
  open_tcp_ports = [
    "80",    /* certbot */
    "443",   /* p2p websocket */
    "30303", /* p2p main */
    /* only on node-01.gc-us-central1-a.wakuv2.prod */
    "9000",  /* chat2bridge */
  ]
}
