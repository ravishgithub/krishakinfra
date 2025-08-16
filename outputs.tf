# outputs.tf

# Compartment OCID (created by this stack)
output "compartment_id" {
  value       = oci_identity_compartment.krishak_compartment.id
  description = "OCID of the Krishak compartment"
}

output "identity_domain_id" {
  value = try(
    oci_identity_domain.krishak_domain[0].id, # when resource uses count = 1
    oci_identity_domain.krishak_domain.id,    # when resource has no count
    null                                      # when resource is not created/commented
  )
  description = "OCID of the Identity Domain (null if not created)"
}


# Public URL for your frontend index.html
output "frontend_bucket_url" {
  value       = "https://objectstorage.${var.region}.oraclecloud.com/n/${data.oci_objectstorage_namespace.ns.namespace}/b/${oci_objectstorage_bucket.krishak_frontend_bucket.name}/o/index.html"
  description = "Public URL to index.html in the frontend bucket"
}
