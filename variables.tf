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

variable "ssh_authorized_key" {
  description = "SSH public key used to connect to the instance"
}

variable "ocpus" {
  description = "Number of OCPUs for the instance"
  default     = 2
}

variable "memory_in_gbs" {
  description = "Memory size in GBs for the instance"
  default     = 32
}

variable "networking_bandwidth_in_gbps" {
  description = "Networking bandwidth in Gbps for the instance"
  default     = 2
}

variable "linuxvm_image_id" {
  description = "OCID of the Oracle Linux 8 image"
}
