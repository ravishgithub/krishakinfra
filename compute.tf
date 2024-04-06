# Boot Volume
resource "oci_core_boot_volume" "rtlinux_boot_volume" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  display_name        = "rtlinux-boot-volume"
  size_in_gbs         = 50  # Adjust size as needed
}

# Block Volume
resource "oci_core_volume" "rtlinux_block_volume" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  display_name        = "rtlinux-block-volume"
  size_in_gbs         = 100  # Adjust size as needed
}
