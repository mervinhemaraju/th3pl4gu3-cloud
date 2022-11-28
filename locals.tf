
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

    database = {
      dynamodb = {
        bucket_list_name = "jeeyah-bucket-list"
      }
    }

    compute = {

      image = {
        ubuntu_oci = "ocid1.image.oc1.af-johannesburg-1.aaaaaaaa7njfmfxcybo66dwsn4u6asz5ecsszyto56ufbltkp7kugixnctxa"
      }

    }

    # > Lambda default configurations
    lambda = {
      SOURCE_PATH          = "./functions/email-function/"
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
