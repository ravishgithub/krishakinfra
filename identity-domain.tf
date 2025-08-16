# identity-domain.tf

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
  count        = var.create_identity_domain ? 1 : 0

  compartment_id          = oci_identity_compartment.krishak_compartment.id
  display_name            = "krishak-id-domain"
  description             = "Identity domain for Krishak"
  home_region             = local.home_region_name
  license_type            = "free"

  # Creation-time workaround (reliable with provider 7.13)
  is_notification_bypassed = true
}

# Safe output (null when domain is skipped)
output "identity_domain_id" {
  value       = var.create_identity_domain ? oci_identity_domain.krishak_domain[0].id : null
  description = "OCID of the Identity Domain (null if not created)"
}
