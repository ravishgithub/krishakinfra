terraform {
  required_version = ">= 1.5.0"
  required_providers {
    oci = {
      source  = "oracle/oci"   # you already initialized 7.14.0
      version = "~> 7.14.0"
    }
  }
}

# OCI Resource Manager runs with Resource Principal auth.
provider "oci" {
  auth   = "ResourcePrincipal"
  region = var.region
}
