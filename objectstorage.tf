# objectstorage.tf
data "oci_objectstorage_namespace" "ns" {}

resource "oci_objectstorage_bucket" "krishak_frontend_bucket" {
  name           = "krishak-frontend"
  compartment_id = oci_identity_compartment.krishak_compartment.id
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  access_type    = "ObjectRead"
  storage_tier   = "Standard"

  # No manual emptying needed on destroy
  force_destroy  = true
}

output "frontend_bucket_url" {
  value       = "https://objectstorage.${var.region}.oraclecloud.com/n/${data.oci_objectstorage_namespace.ns.namespace}/b/${oci_objectstorage_bucket.krishak_frontend_bucket.name}/o/index.html"
  description = "Public URL to index.html in the frontend bucket"
}
