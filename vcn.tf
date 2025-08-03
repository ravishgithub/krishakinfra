// Create a Virtual Cloud Network (VCN) for the Krishak environment

resource "oci_core_virtual_network" "krishak_vcn" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  cidr_block     = "10.0.0.0/16"
  display_name   = "krishak-vcn"
  dns_label      = "krishak"
}
