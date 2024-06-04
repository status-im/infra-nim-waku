/* Token for interacting with Cloudflare API. */
data "pass_password" "cloudflare_token" {
  path = "cloud/Cloudflare/token"
}

/* Email address of Cloudflare account. */
data "pass_password" "cloudflare_email" {
  path = "cloud/Cloudflare/email"
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
