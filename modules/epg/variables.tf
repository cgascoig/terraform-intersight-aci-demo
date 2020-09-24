variable "organization" {
    type = string
}

variable "name" {
  type = string
}

variable "vlanid" {
  type = number
}

variable "nameprefix" {
  type = string
  default = "tf-epg"
}

variable "lan_connectivity_policy" {
  type = string
}

variable "eth_adapter_policy" {
  type = string
}

variable "eth_qos_policy" {
  type = string
}

variable "app_profile" {
  type = string
}

variable "domain" {
  type = string
}