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
  display_name = "kheti_public_route"
  vcn_id = oci_core_virtual_network.kheti_vcn.id
  compartment_id = var.compartment_id

  # Route rule for internet-bound traffic
  route_rules {    
    destination           = "0.0.0.0/0"  # This is the default route for all internet-bound traffic
    destination_type = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.kheti_igw.id
  }
}

resource "oci_core_route_table" "kheti_private_route" {
  display_name = "kheti_private_route"
  vcn_id = oci_core_virtual_network.kheti_vcn.id
  compartment_id = var.compartment_id

   # Route rule for NAT gateway for internet access
  route_rules {    
    destination           = "0.0.0.0/0"  # This is the default route for all internet-bound traffic
    destination_type = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.kheti_nat_gw.id
  }
}