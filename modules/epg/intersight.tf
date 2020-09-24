resource "intersight_vnic_eth_network_policy" "v_eth_network1" {
  name = "${var.nameprefix}-ethnetpol-${var.name}"
  organization {
    object_type = "organization.Organization"
    moid = var.organization
  }
  vlan_settings {
    object_type = "vnic.VlanSettings"
    default_vlan = var.vlanid
    mode = "ACCESS"
  }
}

resource "intersight_vnic_eth_if" "eth1" {
  name = "${var.nameprefix}-ethif-${var.name}"
  order = var.vlanid
  placement {
    id = "1"
    pci_link = 0
    uplink = 0
  }
  cdn {
    value = "VIC-1-eth${var.vlanid}"
    nr_source = "user"
  }
  usnic_settings {
    cos = 5
    nr_count = 0
  }
  vmq_settings {
    enabled = false
    num_interrupts = 16
    num_sub_vnics = 64
    num_vmqs = 4
  }
  lan_connectivity_policy {
    moid = var.lan_connectivity_policy
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_network_policy {
    moid = intersight_vnic_eth_network_policy.v_eth_network1.id
  }
  eth_adapter_policy {
    moid = var.eth_adapter_policy
  }
  eth_qos_policy {
    moid = var.eth_qos_policy
  }
}