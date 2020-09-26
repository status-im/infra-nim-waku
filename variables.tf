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
