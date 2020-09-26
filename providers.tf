provider "digitalocean" {
  token             = data.pass_password.digitalocean_token.password
  spaces_access_id  = data.pass_password.digitalocean_spaces_id.password
  spaces_secret_key = data.pass_password.digitalocean_spaces_key.password
}

provider "cloudflare" {
  email      = data.pass_password.cloudflare_email.password
  api_key    = data.pass_password.cloudflare_token.password
  account_id = data.pass_password.cloudflare_account.password
}

provider "google" {
  credentials = data.pass_password.google_cloud_cred_json.full
  project     = "russia-servers"
  region      = "us-central1"
}

provider "alicloud" {
  access_key = data.pass_password.alicloud_access_key.password
  secret_key = data.pass_password.alicloud_secret_key.password
  region     = "cn-hongkong"
}
