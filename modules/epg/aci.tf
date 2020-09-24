resource "aci_application_epg" "epg" {
  name = "${var.nameprefix}-${var.name}"

  application_profile_dn = var.app_profile
}

resource "aci_epg_to_domain" "static" {
  application_epg_dn = aci_application_epg.epg.id
  tdn = var.domain
  encap = "vlan-${var.vlanid}"
}