variable "shared_key" {
  type      = string
  sensitive = true
}

variable "onprem_primary_public_ip" {
  type = string
}

variable "onprem_secondary_public_ip" {
  type = string
}