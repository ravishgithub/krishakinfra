data "oci_core_boot_volume" "rtlinux_boot_volume" {
  display_name   = "rtlinux-boot-volume"
  compartment_id = var.compartment_id
}

data "oci_core_volume" "rtlinux_block_volume" {
  display_name   = "rtlinux-block-volume"
  compartment_id = var.compartment_id
}

resource "oci_core_instance" "rtlinux_instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = "VM.Standard.E4.Flex"
  display_name        = "rtlinux-instance"
  image_id            = var.linuxvm_image_id  # Replace with the OCID of the Oracle Linux 8 image

  create_vnic_details {
    subnet_id       = oci_core_subnet.kheti_public_subnet.id  # Assuming public subnet is used
    hostname_label = "rtlinux"
  }

  metadata {
    ssh_authorized_keys = var.ssh_authorized_key
  }

  shape_config {
    ocpus                        = var.ocpus
    memory_in_gbs                = var.memory_in_gbs
    networking_bandwidth_in_gbps = var.networking_bandwidth_in_gbps
  }

  boot_volume_details {
    volume_id = data.oci_core_boot_volume.rtlinux_boot_volume.id
  }

  block_volume_details {
    volume_id                      = data.oci_core_volume.rtlinux_block_volume.id
    is_pv_encryption_in_transit_enabled = true
  }
}
