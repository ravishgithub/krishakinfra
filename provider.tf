terraform {
  required_version = ">= 1.5.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 7.14.0"
    }
  }
}

# Let the provider auto-detect auth. Just set region from a var.
provider "oci" {
  region = var.region
}
