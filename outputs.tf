output "compartment_id" {
  value       = oci_identity_compartment.krishak_compartment.id
  description = "OCID of the Krishak compartment"
}

output "identity_domain_id" {
  value       = oci_identity_domain.krishak_domain.id
  description = "OCID of the created Identity Domain"
}

output "frontend_bucket_url" {
  value       = "https://objectstorage.${var.region}.oraclecloud.com/n/${data.oci_objectstorage_namespace.ns.namespace}/b/${oci_objectstorage_bucket.krishak_frontend_bucket.name}/o/index.html"
  description = "URL to access the frontend hosted in Object Storage"
}
