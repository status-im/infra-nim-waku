module "nim_hosts" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  env    = local.ws.env
  stage  = local.ws.stage
  group  = "${local.ws.env}-${local.ws.stage}"
  domain = var.domain

  /* scaling */
  host_count = local.ws["hosts_count"]

  /* instance sizes */
  do_size = local.ws["do_size"] /* DigitalOcean */
  ac_size = local.ws["ac_size"] /* Alibaba Cloud */
  gc_size = local.ws["gc_size"] /* Google Cloud */

  /* firewall */
  open_tcp_ports = [
    "80",    /* certbot */
    "443",   /* p2p websocket */
    "30303", /* p2p main */
    "9000",  /* chat2bridge */
  ]
}
