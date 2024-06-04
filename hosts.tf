module "hosts" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  /* node type */
  env    = "wakuv2"
  stage  = terraform.workspace
  group  = "wakuv2-${terraform.workspace}"

  /* scaling */
  host_count    = 1
  type          = "s-1vcpu-2gb"
  data_vol_size = 40

  /* firewall */
  open_tcp_ports = [
    "80",    /* certbot */
    "443",   /* p2p websockify */
    "8000",  /* p2p websocket */
    "30303", /* p2p main */
    /* only on node-01.gc-us-central1-a.wakuv2.prod */
    "9000",  /* chat2bridge */
  ]
  open_udp_ports = [
    "9000",  /* discovery v5 */
  ]
}
