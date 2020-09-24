resource "intersight_vnic_eth_adapter_policy" "adapter1" {
  name = "tf-eth-adapter1"
  rss_settings = true
  uplink_failback_timeout = 5
  organization {
    object_type = "organization.Organization"
    moid = local.organization
  }
  vxlan_settings {
    enabled = false
  }

  nvgre_settings {
    enabled = true
  }

  arfs_settings {
    enabled = true
  }

  interrupt_settings {
    coalescing_time = 125
    coalescing_type = "MIN"
    nr_count = 4
    mode = "MSI"
  }
  completion_queue_settings {
    nr_count = 4
    ring_size = 1
  }
  rx_queue_settings {
    nr_count = 4
    ring_size = 512
  }
  tx_queue_settings {
    nr_count = 4
    ring_size = 512
  }
  tcp_offload_settings {
    large_receive = true
    large_send = true
    rx_checksum = true
    tx_checksum = true
  }

}

resource "intersight_vnic_eth_qos_policy" "qos1" {
  name = "tf-eth-qos1"
  mtu = 1500
  rate_limit = 0
  cos = 0
  trust_host_cos = false
  organization {
    object_type = "organization.Organization"
    moid = local.organization
  }
}

resource "intersight_vnic_lan_connectivity_policy" "lan1" {
  name = "tf-vnic-lan1"
  organization {
    object_type = "organization.Organization"
    moid = local.organization
  }
  # profiles {
  #   moid = intersight_server_profile.server1.id
  #   object_type = "server.Profile"
  # }
}