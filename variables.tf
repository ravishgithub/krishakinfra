variable "tenancy_ocid" {
  description = "The OCID of your OCI tenancy"
  type        = string
}

variable "region" {
  description = "OCI region (e.g. ap-mumbai-1)"
  type        = string
  default     = "ap-mumbai-1"
}

variable "availability_domain" {
  description = "Availability Domain for zonal resources"
  type        = string
  default     = "nJCt:AP-MUMBAI-1-AD-1"
}

variable "admin_first_name" {
  description = "Administrator first name for identity domain"
  type        = string
}

variable "admin_last_name" {
  description = "Administrator last name for identity domain"
  type        = string
}

variable "admin_email" {
  description = "Administrator email for identity domain"
  type        = string
}

# Toggle to create the Identity Domain (useful for sandboxes)
variable "create_identity_domain" {
  description = "Whether to create the Identity Domain (set false to skip)"
  type        = bool
  default     = true
}
