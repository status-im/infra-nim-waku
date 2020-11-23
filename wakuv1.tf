module "nim_waku" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  env    = "wakuv1"
  group  = "wakuv1"
  domain = var.domain

  /* scaling */
  host_count = local.ws["hosts_count"]

  /* instance sizes */
  do_size = local.ws["do_size"] /* DigitalOcean */
  ac_size = local.ws["ac_size"] /* Alibaba Cloud */
  gc_size = local.ws["gc_size"] /* Google Cloud */

  /* firewall */
  open_tcp_ports = [ "443" /* p2p */ ]
}
