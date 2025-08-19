# Release v1.0.0 – Krishakinfra

## Overview
This release marks the first stable version (`v1.0.0`) of the Krishakinfra Terraform infrastructure for the Krishak application. All resources have been successfully provisioned using Oracle Resource Manager (ORM) stack.

## Key Features
- **OCI Compartment**: Dedicated compartment for all Krishak resources
- **Identity Domain**: Optional identity domain for authentication, with notification bypass
- **Networking**:
  - Virtual Cloud Network (VCN) for resource isolation
  - Public and private subnets
  - Route tables for public (Internet Gateway) and private (NAT, Service Gateway) traffic
  - Security lists and Network Security Group for API backend (port 8080)
- **Object Storage**: Bucket for hosting frontend static files
- **Outputs**: Exposes OCIDs and public URLs for integration with backend and frontend

## Usage
- Deploy infrastructure using ORM or locally with Terraform CLI
- Upload frontend files to the object storage bucket after deployment
- Use output values for integration with backend and frontend

## Notable Files
- `compartment.tf`, `identity-domain.tf`, `objectstorage.tf`, `vcn.tf`, `subnets.tf`, `route-tables.tf`, `networksecurity.tf`, `nsg.tf`, `outputs.tf`
- `variables.tf`, `terraform.tfvars.example` for configuration
- `provider.tf` for OCI provider setup

## Tag
- This release is tagged as `v1.0.0` and also as `working-orm-stack`

---
For more details, see the README and individual Terraform files in the repository.
