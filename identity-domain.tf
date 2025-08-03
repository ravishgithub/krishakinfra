resource "oci_identity_domain" "krishak_domain" {
  compartment_id   = oci_identity_compartment.krishak_compartment.id
  name             = "krishak-id-domain"
  description      = "Identity domain for Krishak site users"
  license_type     = "free"
  admin_first_name = "Admin"
  admin_last_name  = "User"
  admin_email      = var.admin_email
}

resource "oci_identity_domain_group" "admins" {
  domain_id     = oci_identity_domain.krishak_domain.id
  display_name  = "Krishak_Admins"
}

resource "oci_identity_domain_group" "developers" {
  domain_id     = oci_identity_domain.krishak_domain.id
  display_name  = "Krishak_Developers"
}
