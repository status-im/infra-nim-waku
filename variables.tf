/* PROVIDERS ------------------------------------*/

variable "cloudflare_email" {
  description = "Email address of Cloudflare account."
  type        = string
}

variable "cloudflare_token" {
  description = "Token for interacting with Cloudflare API."
  type        = string
}

variable "cloudflare_account" {
  description = "ID of CloudFlare Account."
}

variable "digitalocean_token" {
  description = "Token for interacting with DigitalOcean API."
  type        = string
}

variable "digitalocean_spaces_id" {
  description = "ID for access to DigitalOcean spaces API."
  type        = string
}

variable "digitalocean_spaces_key" {
  description = "Key for access to DigitalOcean spaces API."
  type        = string
}


variable "alicloud_access_key" {
  description = "Alibaba Cloud API access key."
  type        = string
}

variable "alicloud_secret_key" {
  description = "Alibaba Cloud API secret key."
  type        = string
}

/* CONFIG ----------------------------------------*/

variable "ssh_keys" {
  description = "Names of ssh public keys to add to created hosts"
  type        = list(string)
  # ssh key IDs acquired using doctl
  default = ["16822693", "18813432", "18813461", "19525749", "20671731", "20686611"]
}

variable "domain" {
  description = "DNS Domain to update"
  type        = string
  default     = "statusim.net"
}

variable "ssh_user" {
  description = "User used to log in to instance"
  type        = string
  default     = "root"
}
