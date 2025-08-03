resource "oci_identity_domain" "krishak_domain" {
  compartment_id    = oci_identity_compartment.krishak_compartment.id
  display_name      = "krishak-id-domain"
  description       = "Identity domain for Krishak users"
  home_region       = var.region
  license_type      = "free"
  admin_first_name  = "Admin"
  admin_last_name   = "User"
  admin_email       = var.admin_email
}
