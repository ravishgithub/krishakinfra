# Create a security list for the public subnet
resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.kheti_vcn.id
  display_name   = "public-security-list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for SSH
    source      = "${oci_core_security_list.private_security_list.id}"  # Replace with appropriate source
    tcp_options {
      destination_port_range = "22"   # SSH port
    }
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for RDP
    source      = "${oci_core_security_list.private_security_list.id}"  # Replace with appropriate source
    tcp_options {
      destination_port_range = "3389"   # RDP port
    }
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for HTTP
    source      = "0.0.0.0/0"  # Allow from anywhere for HTTP
    tcp_options {
      destination_port_range = "80"   # HTTP port
    }
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for HTTPS
    source      = "0.0.0.0/0"  # Allow from anywhere for HTTPS
    tcp_options {
      destination_port_range = "443"   # HTTPS port
    }
  }
}

# Create a network security group for the private subnet
resource "oci_core_network_security_group" "private_network_security_group" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.kheti_vcn.id
  display_name   = "private-network-security-group"

  egress_security_rules {
    destination     = "0.0.0.0/0"
    protocol        = "all"
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for ingress traffic
    source      = "${oci_core_security_list.public_security_list.id}"
    tcp_options {
      destination_port_range = "0-65535"   # Allow all ports from the public security list
    }
  }
}

# Create a security list for the private subnet
resource "oci_core_security_list" "private_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.kheti_vcn.id
  display_name   = "private-security-list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol    = "6"   # TCP protocol for ingress traffic
    source      = "${oci_core_network_security_group.private_network_security_group.id}"
  }
}
