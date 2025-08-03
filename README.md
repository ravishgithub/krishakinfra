# Krishakinfra Terraform Infrastructure

This repository provisions Oracle Cloud Infrastructure (OCI) resources for the Krishak application using Terraform.

## 🧱 What It Creates

- OCI Compartment: `krishakcompartment`
- Identity Domain and two IAM groups
- Network Security Group for the API backend
- Object Storage bucket to host the React frontend

## 🚀 How to Deploy Using Oracle Resource Manager (ORM)

### 1. Prepare

Push this repo to GitHub. Ensure it includes:
- All `.tf` files
- Your own `terraform.tfvars` file (or provide variables in ORM UI)

### 2. Create Stack in ORM

1. Go to **OCI Console → Developer Services → Resource Manager → Stacks**
2. Click **Create Stack**
3. Choose **GitHub** as source and select your repo and branch
4. Provide input values manually or through `terraform.tfvars`
5. Run Plan → Apply

### 3. Required Inputs

Example `terraform.tfvars`:

```
tenancy_ocid         = "ocid1.tenancy.oc1..your_ocid"
region               = "ap-mumbai-1"
availability_domain  = "nJCt:AP-MUMBAI-1-AD-1"
admin_email          = "your-admin@example.com"
```

### 4. Accessing React Frontend

Once deployed, upload your React `index.html` and static files to the generated bucket using:

```
oci os object put -bn krishak-frontend --file index.html --content-type text/html
```

Access it via the output URL from Terraform.

---
