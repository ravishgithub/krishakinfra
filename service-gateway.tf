data "oci_core_services" "all" {}

resource "oci_core_service_gateway" "krishak_service_gateway" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  vcn_id         = oci_core_virtual_network.krishak_vcn.id
  display_name   = "krishak-service-gateway"

  services {
    service_id = [for s in data.oci_core_services.all.services : s.id if s.cidr_block == "oci-services"][0]
  }
}
