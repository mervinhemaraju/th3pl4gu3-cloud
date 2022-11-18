
# * Create a compute instance for web
resource "oci_core_instance" "web-01" {

  availability_domain = data.oci_identity_availability_domain.availability_domain.name
  compartment_id      = var.compartment_production_id

  display_name = "web-01"

  shape = "VM.Standard.E2.1.Micro"

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet-public-web.id
    assign_public_ip = false
    private_ip       = var.instance_private_id_web_01
  }

  source_details {
    source_type             = "image"
    source_id               = "ocid1.image.oc1.af-johannesburg-1.aaaaaaaa7njfmfxcybo66dwsn4u6asz5ecsszyto56ufbltkp7kugixnctxa"
    boot_volume_size_in_gbs = "80"
  }

  metadata = {
    ssh_authorized_keys = var.compute_auth_ssh_key_pub
  }

}

# * Create a reserver public ip
resource "oci_core_public_ip" "res-ip-web-01" {

  compartment_id = var.compartment_production_id
  lifetime       = "RESERVED"

  display_name  = "res-ip-web-01"
  private_ip_id = data.oci_core_private_ips.private-ips-web-01.private_ips[0]["id"]

  depends_on = [
    oci_core_subnet.subnet-public-web
  ]
}
