
terraform {
  required_version = ">= 0.13"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = " = 2.10.1"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = " = 1.22.2"
    }
    alicloud = {
      source = "aliyun/alicloud"
      version = " = 1.95.0"
    }
    google = {
      source = "hashicorp/google"
      version = " = 3.37.0"
    }
  }
}
