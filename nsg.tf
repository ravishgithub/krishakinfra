resource "oci_core_network_security_group" "api_nsg" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  vcn_id         = oci_core_virtual_network.krishak_vcn.id
  display_name   = "krishak-api-nsg"
}

resource "oci_core_network_security_group_security_rule" "api_ingress" {
  network_security_group_id = oci_core_network_security_group.api_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      min = 8080
      max = 8080
    }
  }
}
