
# * Gets the availability domain from OCI
data "oci_identity_availability_domain" "availability_domain" {
  compartment_id = var.compartment_production_id
  ad_number      = 1
}

# * Gets the OCID of the private address
data "oci_core_private_ips" "private-ips-web-01" {
  ip_address = var.instance_private_id_web_01
  subnet_id  = oci_core_subnet.subnet-public-web.id

  depends_on = [
    oci_core_instance.web-01,
    oci_core_subnet.subnet-public-web
  ]
}
