terraform {
  required_providers {
    intersight = {
      source  = "terraform.cisco.com/cisco-intersight/intersight"
      version = "0.1.3"
    }
    aci = {
      source = "terraform-providers/aci"
      version = "~> 0.4.0"
    }
  }
}

provider "intersight" {
  apikey        = var.intersight_key_id
  secretkeyfile = var.intersight_key_file
  endpoint      = "intersight.com"
}

provider "aci" {
  username = var.aci_username
  password = var.aci_password
  url      = var.aci_url
  insecure = var.aci_insecure
}

variable "intersight_key_id" {
  type = string
}

variable "intersight_key_file" {
  type = string
}

variable "aci_username" {
  type = string
}

variable "aci_password" {
  type = string
}

variable "aci_url" {
  type = string
}

variable "aci_insecure" {
  type    = bool
  default = true
}