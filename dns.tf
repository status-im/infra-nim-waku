/* CloudFlare Zone IDs required for records */
data "cloudflare_zones" "vac_dev" {
  filter { name = "vac.dev" }
}

/* Proof-of-concept of DNS discovery according to EIP-1459.
 * Issue: https://github.com/status-im/infra-nim-waku/issues/23
 * TODO: Automate this to be generated based on Consul data. */
resource "cloudflare_record" "dns_discovery" {
  zone_id = data.cloudflare_zones.vac_dev.zones[0].id
  count   = length(local.ws["dns_records"])
  type    = lookup(local.ws["dns_records"][count.index], "type", "TXT")
  ttl     = lookup(local.ws["dns_records"][count.index], "ttl", 86900)
  value   = lookup(local.ws["dns_records"][count.index], "dest")
  name    = "${lookup(local.ws["dns_records"][count.index], "name", "@")}${local.ws.stage}.nodes"
}
