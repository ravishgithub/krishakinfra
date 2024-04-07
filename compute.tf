
resource "oci_core_instance" "rtlinux_instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = var.instance_shape
  display_name        = "rtlinux-instance"

  create_vnic_details {
    subnet_id       = oci_core_subnet.kheti_public_subnet.id
    hostname_label = "rtlinux"
  }

  metadata = {
    ssh_authorized_keys = var.ssh_authorized_key
  }

  shape_config {
    ocpus                        = var.ocpus
    memory_in_gbs                = var.memory_in_gbs
    ##networking_bandwidth_in_gbps = var.networking_bandwidth_in_gbps
  }

   source_details {
    source_type = "image"
    source_id = var.linuxvm_image_id
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
  } 
  
}
