module "nim_waku_v2" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  /* node type */
  env    = "wakuv2"
  group  = "wakuv2"
  domain = var.domain

  /* instance sizes */
  size = "s-1vcpu-1gb"

  /* firewall */
  open_tcp_ports = [ "60000" /* p2p */ ]
}
