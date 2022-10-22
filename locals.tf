
locals {

  # > Tags for resources
  tags = {
    default = {
      Creator     = "mervin.hemaraju"
      Project     = "th3pl4gu3-aws"
      Usage       = "Personal"
      Environment = "Production"
    }
  }

  # > Resources Constants
  constants = {

    # > Lambda default configurations
    lambda = {
      SOURCE_PATH          = "./functions/email-function/"
      RCE                  = 2
      RETRIES_ATTEMPT      = 0
      TIMEOUT              = "60"
      HANDLER              = "main.main"
      VERSION              = "python3.9"
      MEMORY_SIZE          = 128
      CLOUDWATCH_RETENTION = 7
      TRUSTED_ENTITIES = [
        {
          type = "Service",
          identifiers = [
            "lambda.amazonaws.com"
          ]
        }
      ]
    }

  }
}
