# Uses PASSWORD_STORE_DIR environment variable
provider "pass" { refresh_store = false }

/* Token for interacting with Cloudflare API. */
data "pass_password" "cloudflare_token" {
  path = "cloud/Cloudflare/token"
}

/* Email address of Cloudflare account. */
data "pass_password" "cloudflare_email" {
  path = "cloud/Cloudflare/email"
}

/* ID of CloudFlare Account. */
data "pass_password" "cloudflare_account" {
  path = "cloud/Cloudflare/account"
}

/* Token for interacting with DigitalOcean API. */
data "pass_password" "digitalocean_token" {
  path = "cloud/DigitalOcean/token"
}

/* Access key for Digital Ocean Spaces API. */
data "pass_password" "digitalocean_spaces_id" {
  path = "cloud/DigitalOcean/spaces-id"
}

/* Secret key for Digital Ocean Spaces API. */
data "pass_password" "digitalocean_spaces_key" {
  path = "cloud/DigitalOcean/spaces-key"
}

/* Alibaba Cloud API access key. */
data "pass_password" "alicloud_access_key" {
  path = "cloud/Alibaba/access-key"
}

/* Alibaba Cloud API secret key. */
data "pass_password" "alicloud_secret_key" {
  path = "cloud/Alibaba/secret-key"
}

/* Google Cloud API auth JSON */
data "pass_password" "google_cloud_cred_json" {
  path = "cloud/GoogleCloud/json"
}
