# Krishakinfra 
# Deploying Oracle Cloud Infrastructure Resources with Terraform

This repository contains Terraform code to provision resources on Oracle Cloud Infrastructure (OCI). It includes configurations for setting up a VCN, subnets, gateways, and routing.

## Prerequisites

Before getting started, ensure you have the following:
- An Oracle Cloud Infrastructure account
- Terraform installed locally
- API key and necessary credentials to access OCI

## Getting Started

### Clone the Repository
### create terraform.tfvvars with values for variables declared in variables.tf
### You can skip where default provided
Clone this repository to your local machine:

```bash
git clone git@github.com:ravishgithub/krishakinfra.git
cd krishakinfra
terroform init
terraform plan
terraform apply