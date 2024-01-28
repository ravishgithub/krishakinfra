resource "oci_core_virtual_network" "kheti_vcn" {
  cidr_block    = "10.0.0.0/16"
  display_name  = "kheti_vcn"
  compartment_id = var.compartment_id
}

resource "oci_core_internet_gateway" "kheti_igw" {
  display_name = "kheti_igw"
  vcn_id       = oci_core_virtual_network.kheti_vcn.id
  compartment_id = var.compartment_id
}

resource "oci_core_nat_gateway" "kheti_nat_gw" {
  display_name = "kheti_nat_gw"
  vcn_id       = oci_core_virtual_network.kheti_vcn.id
  compartment_id = var.compartment_id
}


resource "oci_core_service_gateway" "kheti_service_gw" {
  display_name    = "kheti_service_gw"
  vcn_id          = oci_core_virtual_network.kheti_vcn.id
  compartment_id  = var.compartment_id

  services {
    service_id = "objectstorage"  # Replace with the actual OCI service OCID
  }
}

