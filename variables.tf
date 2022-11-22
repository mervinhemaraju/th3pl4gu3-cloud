
# > Secret variable
# * Terraform AWS providers vars
variable "region" {
  type      = string
  sensitive = true
}
variable "aws_access_key" {
  type      = string
  sensitive = true
}
variable "aws_secret_key" {
  type      = string
  sensitive = true
}

# * Gmail APP Token
variable "gmail_app_token" {
  type      = string
  sensitive = true
}

# * OCI vars
variable "compartment_root_id" {
  type      = string
  sensitive = true
}

variable "compartment_production_id" {
  type      = string
  sensitive = true
}

variable "compute_auth_ssh_key_pub" {
  type      = string
  sensitive = true
}

variable "instance_private_id_web_01" {
  type = string
}
