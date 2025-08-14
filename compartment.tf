# compartment.tf
resource "oci_identity_compartment" "krishak_compartment" {
  compartment_id = var.tenancy_ocid   # <-- parent is the TENANCY (root)
  name           = "krishakcompartment"
  description    = "Compartment for Krishak application resources"
  enable_delete  = true
}
