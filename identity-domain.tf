resource "oci_identity_domains" "krishak_domain" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  display_name   = "krishak-id-domain"
  home_region    = var.region
  license_type   = "free"
  admin = {
    first_name = "Admin"
    last_name  = "User"
    email      = var.admin_email
  }
}

resource "oci_identity_domains_groups" "admins" {
  domain_id    = oci_identity_domains.krishak_domain.id
  display_name = "Krishak_Admins"
}

resource "oci_identity_domains_groups" "developers" {
  domain_id    = oci_identity_domains.krishak_domain.id
  display_name = "Krishak_Developers"
}
