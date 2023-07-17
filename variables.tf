variable "droplet_name" {
  default     = "vm-devops"
  type        = string
  description = "Droplets started name"
}

variable "droplet_region" {
  default     = "nyc1"
  type        = string
  description = "Region where droplets will be created"
}

variable "droplet_size" {
  default     = "s-1vcpu-2gb"
  type        = string
  description = "Droplets configuration type"

}

variable "ssh_keyname" {
  default     = "vm-devops"
  type        = string
  description = "Ssh key used to connect to the droplets"
}

variable "do_token" {
}

variable "droplets_count" {
  default     = 1
  type        = number
  description = "Number of droplets to create"
}