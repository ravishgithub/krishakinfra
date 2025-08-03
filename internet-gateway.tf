resource "oci_core_internet_gateway" "krishak_igw" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  vcn_id         = oci_core_virtual_network.krishak_vcn.id
  display_name   = "krishak-igw"
  enabled        = true
}
