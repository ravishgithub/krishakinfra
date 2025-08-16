# objectstorage.tf
data "oci_objectstorage_namespace" "ns" {}

resource "oci_objectstorage_bucket" "krishak_frontend_bucket" {
  name           = "krishak-frontend"
  compartment_id = oci_identity_compartment.krishak_compartment.id
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  access_type    = "ObjectRead"
  storage_tier   = "Standard"

  # No manual emptying needed on destroy
  # force_destroy  = true   <-- REMOVE this line; not supported by OCI provider
}

