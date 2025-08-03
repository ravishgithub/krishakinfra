resource "oci_identity_compartment" "krishak_compartment" {
  name           = "krishakcompartment"
  description    = "Compartment for Krishak application resources"
  enable_delete  = true
}
