
# > OCI Security Lists
resource "oci_core_security_list" "oci_web_security_list" {

  compartment_id = var.compartment_production_id
  vcn_id         = oci_core_vcn.prod-web-vcn.id

  display_name = "web-security-list"

  egress_security_rules {

    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"

    description = "Outbound internet traffic"

  }

  ingress_security_rules {

    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = 6 #* TCP protocol code

    description = "Inbound HTTP Traffic"

    tcp_options {
      max = 80
      min = 80
    }
  }

  ingress_security_rules {

    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = 6 #* TCP protocol code

    description = "Inbound Flask Deployment Traffic"

    tcp_options {
      max = 8085
      min = 8080
    }
  }

  ingress_security_rules {

    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = 6 #* TCP protocol code

    description = "Inbound HTTPS Traffic"

    tcp_options {
      max = 443
      min = 443
    }
  }
}
