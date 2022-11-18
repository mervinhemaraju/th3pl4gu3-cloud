
# * Terraform Provider for AWS for the connection
provider "aws" {

  # * The AWS Environment Configurations
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  # * The Default Tags
  default_tags {
    tags = local.tags.default
  }
}

# * OCI Provider for Oracle cloud connection
provider "oci" {
  alias = "oci"
}

# * The Terraform Module
terraform {

  # * Terraform version
  required_version = ">= 1.0.0"

  # * AWS Provider
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }

    oci = {
      source  = "oracle/oci"
      version = "4.100.0"
    }
  }

  # * Backend Configuration for Terraform Cloud
  backend "local" {
    path = "/Users/mervin.hemaraju/Documents/Personal/tf-state-files/th3pl4gu3-aws/terraform.tfstate"
  }
}
