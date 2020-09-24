data "aci_tenant" "tenant1" {
  name = local.tenant
}

data "aci_physical_domain" "static" {
  name = "static_physDom"
}

resource "aci_application_profile" "ap1" {
  tenant_dn  = data.aci_tenant.tenant1.id
  name       = "tf-ap"
}