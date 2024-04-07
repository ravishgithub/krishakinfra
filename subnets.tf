resource "oci_core_subnet" "kheti_public_subnet" {
  cidr_block         = "10.0.1.0/24"
  display_name       = "kheti_public_subnet"
  vcn_id             = oci_core_virtual_network.kheti_vcn.id
  compartment_id     = var.compartment_id
  availability_domain = var.availability_domain
  route_table_id     = oci_core_route_table.kheti_public_route.id
}

resource "oci_core_subnet" "kheti_private_subnet" {
  cidr_block         = "10.0.2.0/24"
  display_name       = "kheti_private_subnet"
  vcn_id             = oci_core_virtual_network.kheti_vcn.id
  compartment_id     = var.compartment_id
  availability_domain = var.availability_domain
  route_table_id     = oci_core_route_table.kheti_private_route.id  
}

resource "oci_core_route_table" "kheti_public_route" {
  vcn_id = oci_core_virtual_network.kheti_vcn.id
  compartment_id = var.compartment_id
}

resource "oci_core_route_table" "kheti_private_route" {
  vcn_id = oci_core_virtual_network.kheti_vcn.id
  compartment_id = var.compartment_id
}