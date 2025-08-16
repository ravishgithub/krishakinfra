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

  admin_first_name         = var.admin_first_name
  admin_last_name          = var.admin_last_name
  admin_email              = var.admin_email
  is_notification_bypassed = true
}
