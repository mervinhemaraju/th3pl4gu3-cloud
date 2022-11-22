
# > OCI Networking

# * Create a virtual cloud network for OCI
resource "oci_core_vcn" "prod-web-vcn" {

  compartment_id = var.compartment_production_id

  cidr_blocks    = ["10.16.0.0/16"]
  display_name   = "web-vcn"
  dns_label      = "web"
  is_ipv6enabled = false
}

# * Create a public subnet for web
resource "oci_core_subnet" "subnet-public-web" {

  cidr_block     = "10.16.1.0/24"
  compartment_id = var.compartment_production_id
  vcn_id         = oci_core_vcn.prod-web-vcn.id

  display_name               = "subnet-public-web"
  dns_label                  = "publicweb"
  prohibit_public_ip_on_vnic = false
  route_table_id             = oci_core_vcn.prod-web-vcn.default_route_table_id
  security_list_ids          = [oci_core_vcn.prod-web-vcn.default_security_list_id, oci_core_security_list.oci_web_security_list.id]

  depends_on = [
    oci_core_vcn.prod-web-vcn,
    oci_core_security_list.oci_web_security_list
  ]
}

# * Create a main Internet gateway for the compartment
resource "oci_core_internet_gateway" "prod-ig" {

  compartment_id = var.compartment_production_id
  vcn_id         = oci_core_vcn.prod-web-vcn.id

  enabled      = true
  display_name = "prod-ig"

  depends_on = [
    oci_core_vcn.prod-web-vcn
  ]
}
