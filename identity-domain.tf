# identity-domain.tf
# Uses tenancy home region automatically and provides all required admin fields.
data "oci_identity_tenancy" "tenancy" {
  tenancy_id = var.tenancy_ocid
}

data "oci_identity_regions" "regions" {}

locals {
  home_region_name = one([
    for r in data.oci_identity_regions.regions.regions : r.name
    if r.key == data.oci_identity_tenancy.tenancy.home_region_key
  ])
}

resource "oci_identity_domain" "krishak_domain" {
  compartment_id           = oci_identity_compartment.krishak_compartment.id
  display_name             = "krishak-id-domain"
  description              = "Identity domain for Krishak"
  home_region              = local.home_region_name
  license_type             = "free"

  admin_first_name         = "Admin"
  admin_last_name          = "User"
  admin_email              = var.admin_email
  is_notification_bypassed = false
}
