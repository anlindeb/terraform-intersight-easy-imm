#_________________________________________________________________________
#
# Intersight SAN Connectivity Policies Variables
# GUI Location: Configure > Policies > Create Policy > Fibre Channel Adapter
# GUI Location: Configure > Policies > Create Policy > Fibre Channel Network
# GUI Location: Configure > Policies > Create Policy > Fibre Channel QoS
# GUI Location: Configure > Policies > Create Policy > SAN Connectivity
#_________________________________________________________________________

variable "policy_vhba_san_connectivity" {
  default = {
    default = {
      adapter_template             = "VMware" # Linux, VMware, Windows
      description                  = ""
      organization                 = "default"
      placement_mode               = "custom"
      target_platform              = "FIAttached"
      qos_burst                    = 1024
      qos_cos                      = 3
      qos_max_data_field_size      = 2112
      qos_rate_limit               = 0
      tags                         = []
      vsan_a                       = 100
      vsan_a_default_vlan_id       = 0
      vsan_b                       = 200
      vsan_b_default_vlan_id       = 0
      vhba_name_a                  = "vhba-a"
      vhba_name_b                  = "vhba-b"
      vhba_order_a                 = 2
      vhba_order_b                 = 3
      vhba_persistent_lun_bindings = false
      vhba_placement_pci_link_a    = 0
      vhba_placement_pci_link_b    = 0
      vhba_placement_slot_id       = "MLOM"
      vhba_placement_switch_a      = "A"
      vhba_placement_switch_b      = "B"
      vhba_placement_uplink        = 0
      vhba_type                    = "fc-initiator"
      wwnn_address_static          = ""
      wwnn_address_type            = "POOL"
      wwnn_pool                    = ""
      wwpn_address_a_static        = ""
      wwpn_address_b_static        = ""
      wwpn_address_type            = "POOL"
      wwpn_pool_a_name             = ""
      wwpn_pool_b_name             = ""
    }
  }
  description = <<-EOT
  key - Name of the vHBA Template Policy.
  1. adapter_template - The Type of vhba Adapter Policy to assign to the vhba Template.  Options are:
    * Linux
    * Linux-NVMe-ROCE
    * VMware
    * Windows
  2. description - Description to Assign to the Policy.
  3. organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  4. placement_mode - The mode used for placement of vhbas on network adapters. Options are:
    * auto
    * custom
  5. qos_burst - The burst traffic, in bytes, allowed on the vHBA.  Value can be between 1024-1000000.
  6. qos_cos - Class of Service to be associated to the traffic on the virtual interface.  Value can be between 0-6. For FIAttached this should always be 0.
  7. qos_max_data_field_size - The maximum size of the Fibre Channel frame payload bytes that the virtual interface supports.
  8. qos_rate_limit - The value in Mbps (0-10G/40G/100G depending on Adapter Model) to use for limiting the data rate on the virtual interface. Setting this to zero will turn rate limiting off.  Range is between 0-100000.
  9. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  10. target_platform - The platform for which the server profile is applicable. It can either be:
    * Standalone - a server that is operating independently
    * FIAttached - A Server attached to a Intersight Managed Domain.
  11. vsan_a - VSAN ID for the vHBA on Fabric A.
  12. vsan_a_default_vlan_id - Only required for Standalone Servers.  Default VLAN of the virtual interface in Standalone Rack server. Setting the value to 0 is equivalent to None and will not associate any Default VLAN to the traffic on the virtual interface (0-4094).
  13. vsan_b - VSAN ID for the vHBA on Fabric B.
  14. vsan_b_default_vlan_id - Only required for Standalone Servers.  Default VLAN of the virtual interface in Standalone Rack server. Setting the value to 0 is equivalent to None and will not associate any Default VLAN to the traffic on the virtual interface (0-4094).
  15. vhba_name_a - Name of the virtual fibre-channel interface.
  16. vhba_name_b - Name of the virtual fibre-channel interface.
  17. vhba_order_a - The order in which the virtual interface is brought up. The order assigned to an interface should be unique for all the Ethernet and Fibre-Channel interfaces on each PCI link on a VIC adapter. The maximum value of PCI order is limited by the number of virtual interfaces (Ethernet and Fibre-Channel) on each PCI link on a VIC adapter. All VIC adapters have a single PCI link except VIC 1385 which has two.
  18. vhba_order_b - The order in which the virtual interface is brought up. The order assigned to an interface should be unique for all the Ethernet and Fibre-Channel interfaces on each PCI link on a VIC adapter. The maximum value of PCI order is limited by the number of virtual interfaces (Ethernet and Fibre-Channel) on each PCI link on a VIC adapter. All VIC adapters have a single PCI link except VIC 1385 which has two.
  19. vhba_persistent_lun_bindings - Enables retention of LUN ID associations in memory until they are manually cleared.
  20. vhba_placement_pci_link_a - The PCI Link used as transport for the virtual interface. All VIC adapters have a single PCI link except VIC 1385 which has two.
  21. vhba_placement_pci_link_b - The PCI Link used as transport for the virtual interface. All VIC adapters have a single PCI link except VIC 1385 which has two.
  22. vhba_placement_slot_id - PCIe Slot where the VIC adapter is installed. Supported values are:
    * 1-15
    * MLOM
  23. vhba_placement_switch_a - The fabric port to which the vhbas will be associated.
    * A - Fabric A of the FI cluster.
    * B - Fabric B of the FI cluster.
    * None - Fabric Id is not set to either A or B for the standalone case where the server is not connected to Fabric Interconnects.
  24. vhba_placement_switch_b -The fabric port to which the vhbas will be associated.
    * A - Fabric A of the FI cluster.
    * B - Fabric B of the FI cluster.
    * None - Fabric Id is not set to either A or B for the standalone case where the server is not connected to Fabric Interconnects.
  25. vhba_placement_uplink - Adapter port on which the virtual interface will be created.
  26. vhba_type - VHBA Type configuration for SAN Connectivity Policy. This configuration is supported only on Cisco VIC 14XX series and higher series of adapters.
    * fc-initiator - The default value set for vHBA Type Configuration. Fc-initiator specifies vHBA as a consumer of storage. Enables SCSI commands to transfer data and status information between host and target storage systems.\
    * fc-nvme-initiator - Fc-nvme-initiator specifies vHBA as a consumer of storage. Enables NVMe-based message commands to transfer data and status information between host and target storage systems.
    * fc-nvme-target - Fc-nvme-target specifies vHBA as a provider of storage volumes to initiators. Enables NVMe-based message commands to transfer data and status information between host and target storage systems. Currently tech-preview, only enabled with an asynchronous driver.
    * fc-target - Fc-target specifies vHBA as a provider of storage volumes to initiators. Enables SCSI commands to transfer data and status information between host and target storage systems. fc-target is enabled only with an asynchronous driver.
  27. wwnn_address_static - The WWNN address for the server node must be in hexadecimal format xx:xx:xx:xx:xx:xx:xx:xx.  Allowed ranges are 20:00:00:00:00:00:00:00 to 20:FF:FF:FF:FF:FF:FF:FF or from 50:00:00:00:00:00:00:00 to 5F:FF:FF:FF:FF:FF:FF:FF.  To ensure uniqueness of WWN's in the SAN fabric, you are strongly encouraged to use the WWN prefix - 20:00:00:25:B5:xx:xx:xx.
  28. wwnn_address_type - Type of allocation selected to assign a WWNN address for the server node.
    * POOL - The user selects a pool from which the mac/wwn address will be leased for the Virtual Interface.
    * STATIC - The user assigns a static mac/wwn address for the Virtual Interface.
  29. wwnn_pool - WWNN Pool Name to Assign to the Policy.
  30. wwpn_address_a_static - The WWPN address must be in hexadecimal format xx:xx:xx:xx:xx:xx:xx:xx. Allowed ranges are 20:00:00:00:00:00:00:00 to 20:FF:FF:FF:FF:FF:FF:FF or from 50:00:00:00:00:00:00:00 to 5F:FF:FF:FF:FF:FF:FF:FF.  To ensure uniqueness of WWN's in the SAN fabric, you are strongly encouraged to use the WWN prefix - 20:00:00:25:B5:xx:xx:xx.
  31. wwpn_address_b_static - The WWPN address must be in hexadecimal format xx:xx:xx:xx:xx:xx:xx:xx. Allowed ranges are 20:00:00:00:00:00:00:00 to 20:FF:FF:FF:FF:FF:FF:FF or from 50:00:00:00:00:00:00:00 to 5F:FF:FF:FF:FF:FF:FF:FF.  To ensure uniqueness of WWN's in the SAN fabric, you are strongly encouraged to use the WWN prefix - 20:00:00:25:B5:xx:xx:xx.
  32. wwpn_address_type - Type of allocation selected to assign a WWPN address to the vhba.
    * POOL - The user selects a pool from which the WWPN address will be leased for the Virtual Interface.
    * STATIC - The user assigns a static WWPN address for the Virtual Interface.
  33. wwpn_pool_a_name - Name of the WWPN Pool to assign to the vhba Template.
  34. wwpn_pool_b_name - Name of the WWPN Pool to assign to the vhba Template.
  EOT
  type = map(object(
    {
      adapter_template             = optional(string)
      description                  = optional(string)
      organization                 = optional(string)
      placement_mode               = optional(string)
      target_platform              = optional(string)
      qos_burst                    = optional(number)
      qos_cos                      = optional(number)
      qos_max_data_field_size      = optional(number)
      qos_rate_limit               = optional(number)
      tags                         = optional(list(map(string)))
      vsan_a                       = optional(number)
      vsan_a_default_vlan_id       = optional(number)
      vsan_b                       = optional(number)
      vsan_b_default_vlan_id       = optional(number)
      vhba_name_a                  = optional(string)
      vhba_name_b                  = optional(string)
      vhba_order_a                 = optional(number)
      vhba_order_b                 = optional(number)
      vhba_persistent_lun_bindings = optional(bool)
      vhba_placement_pci_link_a    = optional(number)
      vhba_placement_pci_link_b    = optional(number)
      vhba_placement_slot_id       = optional(string)
      vhba_placement_switch_a      = optional(string)
      vhba_placement_switch_b      = optional(string)
      vhba_placement_uplink        = optional(number)
      vhba_type                    = optional(string)
      wwnn_address_static          = optional(string)
      wwnn_address_type            = optional(string)
      wwnn_pool                    = optional(string)
      wwpn_address_a_static        = optional(string)
      wwpn_address_b_static        = optional(string)
      wwpn_address_type            = optional(string)
      wwpn_pool_a_name             = optional(string)
      wwpn_pool_b_name             = optional(string)
    }
  ))
}


#_________________________________________________________________________
#
# SAN Connectivity Policies
# GUI Location: Configure > Policies > Create Policy > SAN Connectivity
#_________________________________________________________________________

module "vhba_san_connectivity" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profile
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_san_connectivity"
  for_each    = local.policy_vhba_san_connectivity
  description = each.value.description != "" ? each.value.description : "${each.key} vHBA SAN Connectivity Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  profiles = [for s in sort(keys(
  local.ucs_server_profiles)) : module.ucs_server_profile[s].moid if local.ucs_server_profiles[s].policy_san_connectivity == each.key]
  placement_mode      = each.value.placement_mode
  static_wwnn_address = each.value.wwnn_address_type == "STATIC" ? each.value.wwnn_address_static : ""
  tags                = each.value.tags != [] ? each.value.tags : local.tags
  target_platform     = each.value.target_platform
  wwnn_pool           = each.value.wwnn_address_type == "POOL" ? [local.fc_pools[each.value.wwnn_pool]] : []
  wwnn_address_type   = each.value.wwnn_address_type
}


#_________________________________________________________________________
#
# vHBA Adapter Polies
# GUI Location: Configure > Policies > Create Policy > Fibre Channel Adapter
#_________________________________________________________________________

/*
FCNVMeTarget
FCNVMeInitiator
Initiator
Linux
Solaris
Target
VMware
Windows
WindowBoot
*/
module "vhba_adapter" {
  depends_on = [
    local.org_moids
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_adapter"
  # for_each = {
  #   for k, v in local.policy_vhba_san_connectivity : k => v
  #   if local.policy_vhba_san_connectivity[k].adapter_template == "VMware"
  # }
  for_each    = local.policy_vhba_san_connectivity
  description = each.value.description != "" ? each.value.description : "${each.key} vHBA Adapter Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  # vHBA Adapter Customization for VMware Template
  # error_detection_timeout          = local.vhba_error_detection_timeout
  # error_recovery_enabled           = local.vhba_error_recovery_enabled
  # error_recovery_io_retry_count    = local.vhba_error_recovery_io_retry_count
  # error_recovery_io_retry_timeout  = local.vhba_error_recovery_io_retry_timeout
  # error_recovery_link_down_timeout = local.vhba_error_recovery_link_down_timeout
  # error_recovery_port_down_timeout = local.vhba_error_recovery_port_down_timeout
  # flogi_retries                    = local.vhba_flogi_retries
  # flogi_timeout                    = local.vhba_flogi_timeout
  # interrupt_mode                   = local.vhba_interrupt_mode
  # io_throttle_count                = local.vhba_io_throttle_count
  # lun_count                        = local.vhba_lun_count
  # lun_queue_depth                  = local.vhba_lun_queue_depth
  # plogi_retries                    = local.vhba_plogi_retries
  # plogi_timeout                    = local.vhba_plogi_timeout
  # resource_allocation_timeout      = local.vhba_resource_allocation_timeout
  # rx_ring_size                     = local.vhba_rx_ring_size
  # scsi_io_queues                   = local.vhba_scsi_io_queues
  # scsi_io_ring_size                = local.vhba_scsi_io_ring_size
  # tags                             = local.tags
  # tx_ring_size                     = local.vhba_tx_ring_size
}


#____________________________________________________________
#
# Fibre Channel (vHBA) Network Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_network_a" {
  depends_on = [
    local.org_moids
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_network"
  for_each        = local.policy_vhba_san_connectivity
  default_vlan_id = each.value.target_platform == "Standalone" ? each.value.vsan_a_default_vlan_id : 0
  description     = each.value.description != "" ? each.value.description : "${each.key} vHBA Network Policy - Fabric A."
  name            = "${each.key}_vsan_a"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = each.value.tags != [] ? each.value.tags : local.tags
  vsan_id         = each.value.vsan_a
}

module "vhba_network_b" {
  depends_on = [
    local.org_moids
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_network"
  for_each        = local.policy_vhba_san_connectivity
  default_vlan_id = each.value.target_platform == "Standalone" ? each.value.vsan_b_default_vlan_id : 0
  description     = each.value.description != "" ? each.value.description : "${each.key} vHBA Network Policy - Fabric B."
  name            = "${each.key}_vsan_b"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = each.value.tags != [] ? each.value.tags : local.tags
  vsan_id         = each.value.vsan_b
}


#____________________________________________________________
#
# Fibre Channel (vHBA) QoS Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_qos" {
  depends_on = [
    local.org_moids
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_qos"
  for_each            = local.policy_vhba_san_connectivity
  burst               = each.value.target_platform == "Standalone" ? each.value.qos_burst : 1024
  cos                 = each.value.target_platform == "FIAttached" ? each.value.qos_cos : 3
  description         = each.value.description != "" ? each.value.description : "${each.key} vHBA QoS Policy."
  max_data_field_size = each.value.qos_max_data_field_size
  name                = "${each.key}_qos"
  org_moid            = local.org_moids[each.value.organization].moid
  rate_limit          = each.value.qos_rate_limit
  tags                = each.value.tags != [] ? each.value.tags : local.tags
}


#______________________________________________
#
# vHBA with Default Values
#______________________________________________

module "vhba_template_a" {
  depends_on = [
    local.org_moids,
    module.vhba_adapter,
    module.vhba_network_a,
    module.vhba_qos,
    module.vhba_san_connectivity,
  ]
  source                  = "terraform-cisco-modules/imm/intersight//modules/policies_vhba"
  for_each                = local.policy_vhba_san_connectivity
  persistent_lun_bindings = each.value.vhba_persistent_lun_bindings
  placement_pci_link      = each.value.vhba_placement_pci_link_a
  placement_slot_id       = each.value.vhba_placement_slot_id
  placement_switch_id     = each.value.vhba_placement_switch_a
  placement_uplink        = each.value.vhba_placement_uplink
  san_connectivity_moid   = module.vhba_san_connectivity[each.key].moid
  static_wwpn_address     = each.value.wwpn_address_type == "STATIC" ? each.value.wwpn_address_a_static : null
  vhba_type               = each.value.vhba_type
  vhba_adapter_moid       = module.vhba_adapter[each.key].moid
  vhba_name               = each.value.vhba_name_a
  vhba_network_moid       = module.vhba_network_a[each.key].moid
  vhba_order              = each.value.vhba_order_a
  vhba_qos_moid           = module.vhba_qos[each.key].moid
  wwpn_address_type       = each.value.wwpn_address_type
  wwpn_pool_moid          = each.value.wwpn_address_type == "POOL" ? [local.fc_pools[each.value.wwpn_pool_a_name]] : []
}

module "vhba_template_b" {
  depends_on = [
    local.org_moids,
    module.vhba_adapter,
    module.vhba_network_b,
    module.vhba_qos,
    module.vhba_san_connectivity,
  ]
  source                  = "terraform-cisco-modules/imm/intersight//modules/policies_vhba"
  for_each                = local.policy_vhba_san_connectivity
  persistent_lun_bindings = each.value.vhba_persistent_lun_bindings
  placement_pci_link      = each.value.vhba_placement_pci_link_b
  placement_slot_id       = each.value.vhba_placement_slot_id
  placement_switch_id     = each.value.vhba_placement_switch_b
  placement_uplink        = each.value.vhba_placement_uplink
  san_connectivity_moid   = module.vhba_san_connectivity[each.key].moid
  static_wwpn_address     = each.value.wwpn_address_type == "STATIC" ? each.value.wwpn_address_a_static : null
  vhba_type               = each.value.vhba_type
  vhba_adapter_moid       = module.vhba_adapter[each.key].moid
  vhba_name               = each.value.vhba_name_b
  vhba_network_moid       = module.vhba_network_b[each.key].moid
  vhba_order              = each.value.vhba_order_b
  vhba_qos_moid           = module.vhba_qos[each.key].moid
  wwpn_address_type       = each.value.wwpn_address_type
  wwpn_pool_moid          = each.value.wwpn_address_type == "POOL" ? [local.fc_pools[each.value.wwpn_pool_a_name]] : []
}
