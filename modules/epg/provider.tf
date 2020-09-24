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