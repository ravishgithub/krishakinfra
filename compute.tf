resource "oci_core_boot_volume" "rtlinux_boot_volume" {
  compartment_id = var.compartment_id
  availability_domain = var.availability_domain
  display_name   = "rtlinux-boot-volume"
  size_in_gbs    = 50  # Adjust size as needed

  source_details {
    source_type = "none"
  }
}

resource "oci_core_volume" "rtlinux_block_volume" {
  compartment_id = var.compartment_id
  availability_domain = var.availability_domain
  display_name   = "rtlinux-block-volume"
  size_in_gbs    = 100  # Adjust size as needed
}

resource "oci_core_instance" "rtlinux_instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = "VM.Standard.E4.Flex"
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
    networking_bandwidth_in_gbps = var.networking_bandwidth_in_gbps
  }

  boot_volume_id = oci_core_boot_volume.rtlinux_boot_volume.id

  block_volume_details {
    volume_id                      = oci_core_volume.rtlinux_block_volume.id
    is_pv_encryption_in_transit_enabled = true
  }
}
