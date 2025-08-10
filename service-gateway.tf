#############################################
# Service Gateway (Region-agnostic lookup)  #
#############################################

data "oci_core_services" "osn" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

resource "oci_core_service_gateway" "krishak_service_gateway" {
  compartment_id = oci_identity_compartment.krishak_compartment.id
  vcn_id         = oci_core_virtual_network.krishak_vcn.id
  display_name   = "krishak-service-gateway"

  services {
    service_id = data.oci_core_services.osn.services[0].id
  }

  lifecycle {
    precondition {
      condition     = length(data.oci_core_services.osn.services) > 0
      error_message = "No OSN service found in this region. Check data.oci_core_services filter."
    }
  }
}
