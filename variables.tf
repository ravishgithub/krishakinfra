variable "compartment_id" {
  description = "OCI Compartment OCID"
}

variable "availability_domain" {
  description = "OCI Availability Domain"
}

variable "tenancy_ocid" {
  description = "OCI Tenancy OCID"
}

# OCI variables

variable "user_ocid" {
  description = "OCI User OCID"
}

variable "fingerprint" {
  description = "API Key Fingerprint"
}

variable "private_key_path" {
  description = "Path to API private key"
}

variable "region" {
  description = "OCI Region Identifier"
}

variable "service_name" {
  type    = string
  default = "objectstorage"
}

variable "object_storage_namespace" {
  type = string
  # Provide the fetched namespace as the default value
  default = "bmmtwsrmmaap"
}