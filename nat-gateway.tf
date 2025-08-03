resource "oci_core_nat_gateway" "krishak_nat" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  vcn_id         = var.vcn_id
  display_name   = "krishak-nat"
}
