provider "digitalocean" {
  token             = data.pass_password.digitalocean_token.password
  spaces_access_id  = data.pass_password.digitalocean_spaces_id.password
  spaces_secret_key = data.pass_password.digitalocean_spaces_key.password
}

provider "cloudflare" {
  email      = data.pass_password.cloudflare_email.password
  api_key    = data.pass_password.cloudflare_token.password
}

# Uses PASSWORD_STORE_DIR environment variable
provider "pass" {}
