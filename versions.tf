
terraform {
  required_version = "~> 0.14.4"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = " = 2.10.1"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = " = 2.5.1"
    }
    alicloud = {
      source  = "aliyun/alicloud"
      version = " = 1.95.0"
    }
    google = {
      source  = "hashicorp/google"
      version = " = 3.42.0"
    }
    pass = {
      source  = "camptocamp/pass"
      version = " = 1.4.0"
    }
  }
}
