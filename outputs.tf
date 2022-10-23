
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
