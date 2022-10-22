# * Python lambda for Email Sending
module "email-function" {

  source  = "terraform-aws-modules/lambda/aws"
  version = "3.3.1"

  function_name = "email-function"
  description   = "The lambda for sending emails from contact forms"
  handler       = local.constants.lambda.HANDLER
  runtime       = local.constants.lambda.VERSION

  memory_size                       = local.constants.lambda.MEMORY_SIZE
  cloudwatch_logs_retention_in_days = local.constants.lambda.CLOUDWATCH_RETENTION
  source_path                       = local.constants.lambda.SOURCE_PATH
  timeout                           = local.constants.lambda.TIMEOUT
  create_async_event_config         = true
  maximum_retry_attempts            = local.constants.lambda.RETRIES_ATTEMPT

  attach_cloudwatch_logs_policy = true

  trusted_entities = local.constants.lambda.TRUSTED_ENTITIES
}
