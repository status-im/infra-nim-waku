
terraform {
  required_version = "> 1.4.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = " = 4.26.0"
    }
    pass = {
      source  = "camptocamp/pass"
      version = " = 2.0.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}
