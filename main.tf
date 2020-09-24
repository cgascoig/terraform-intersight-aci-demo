locals {
  organization = "5deed7fc6972652d33bc48d0"
  tenant = "cgascoig"

  epgs = {
    web = {
      vlanid = 100
    },
    app = {
      vlanid = 200
    },
    db = {
      vlanid = 300
    }
  }
}

module "epg" {
  source = "./modules/epg"

  for_each = local.epgs

  name = each.key
  vlanid = each.value.vlanid

  lan_connectivity_policy = intersight_vnic_lan_connectivity_policy.lan1.moid
  eth_adapter_policy = intersight_vnic_eth_adapter_policy.adapter1.moid
  eth_qos_policy = intersight_vnic_eth_qos_policy.qos1.moid

  app_profile = aci_application_profile.ap1.id
  domain = data.aci_physical_domain.static.id

  # organization = data.intersight_organization_organization.melb.moid
  organization = local.organization
}

# data "intersight_organization_organization" "melb" {
#     name = "Melbourne_LAB"
# }

