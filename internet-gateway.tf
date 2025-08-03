resource "oci_core_internet_gateway" "krishak_igw" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  vcn_id         = var.vcn_id
  display_name   = "krishak-igw"
  enabled        = true
}
