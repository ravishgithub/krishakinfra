resource "oci_core_security_list" "krishak_security_list" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  vcn_id         = oci_core_virtual_network.krishak_vcn.id
  display_name   = "krishak-security-list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 8080
      max = 8080
    }
  }
}
