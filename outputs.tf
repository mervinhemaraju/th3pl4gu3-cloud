
# * Output the lambda function arns
output "gmail_smtp_function_name" {
  value = module.gmail_smtp_function.lambda_function_arn
}

# * Output the lambda function role arns
output "gmail_smtp_function_role" {
  value = module.gmail_smtp_function.lambda_role_arn
}

# * Output the lambda function urls
output "gmail_smtp_function_url" {
  value = module.gmail_smtp_function.lambda_function_url
}

# * Output the OCI AD name
output "oci_ad_name" {
  value = data.oci_identity_availability_domain.availability_domain.name
}

# * Output the public ip for web-01
output "instance-public-ip-web-01" {
  value = oci_core_instance.web-01.public_ip
}
