variable "tenancy_ocid" {
  description = "The OCID of your OCI tenancy"
  type        = string
}

variable "region" {
  description = "Region where resources will be deployed"
  type        = string
  default     = "ap-mumbai-1"
}

variable "availability_domain" {
  description = "Availability Domain used for zonal resources"
  type        = string
  default     = "nJCt:AP-MUMBAI-1-AD-1"
}

variable "admin_email" {
  description = "Administrator email for the identity domain"
  type        = string
}

variable "vcn_id" {
  description = "The OCID of the VCN"
  type        = string
}
