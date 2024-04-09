# Create a security list for the public subnet
resource "oci_core_security_list" "kheti_public_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.kheti_vcn.id
  display_name   = "kheti-public-security-list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for SSH
    source      = "0.0.0.0/0"  # Allow SSH from anywhere
    tcp_options {
      destination_port_range = "22"   # SSH port
    }
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for HTTPS
    source      = "0.0.0.0/0"  # Allow HTTPS from anywhere
    tcp_options {
      destination_port_range = "443"   # HTTPS port
    }
  }
}

# Create a security list for the private subnet
resource "oci_core_security_list" "kheti_private_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.kheti_vcn.id
  display_name   = "kheti-private-security-list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for SSH
    source      = "${oci_core_security_list.kheti_public_security_list.id}"  # Allow SSH only from the public subnet
    tcp_options {
      destination_port_range = "22"   # SSH port
    }
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for HTTPS
    source      = "${oci_core_security_list.kheti_public_security_list.id}"  # Allow HTTPS only from the public subnet
    tcp_options {
      destination_port_range = "443"   # HTTPS port
    }
  }
}
