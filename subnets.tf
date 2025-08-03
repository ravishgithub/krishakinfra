// Define public and private subnets within the Krishak VCN

resource "oci_core_subnet" "public_subnet" {
  compartment_id      = oci_identity_compartment.krishak_compartment.id
  vcn_id              = oci_core_virtual_network.krishak_vcn.id
  cidr_block          = "10.0.1.0/24"
  display_name        = "krishak-public-subnet"
  route_table_id      = oci_core_route_table.krishak_public_rt.id
  dns_label           = "pubsubnet"
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "private_subnet" {
  compartment_id      = oci_identity_compartment.krishak_compartment.id
  vcn_id              = oci_core_virtual_network.krishak_vcn.id
  cidr_block          = "10.0.2.0/24"
  display_name        = "krishak-private-subnet"
  route_table_id      = oci_core_route_table.krishak_private_rt.id
  dns_label           = "prisubnet"
  prohibit_public_ip_on_vnic = true
}
