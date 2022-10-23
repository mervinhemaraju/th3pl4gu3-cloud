
# > Secret Variables
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
