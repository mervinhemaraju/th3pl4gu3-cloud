
# > AWS Resources

# * Create a Dynamo DB Table for the project bucket list
resource "aws_dynamodb_table" "jeeyah_bucket_list" {
  name         = local.constants.database.dynamodb.bucket_list_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "item_id"

  attribute {
    name = "item_id"
    type = "S"
  }

  attribute {
    name = "item_name"
    type = "S"
  }

  attribute {
    name = "item_category"
    type = "S"
  }

  attribute {
    name = "item_status"
    type = "S"
  }

  global_secondary_index {
    name            = "item_name_index"
    hash_key        = "item_name"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "item_status_index"
    hash_key        = "item_status"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "item_category_index"
    hash_key        = "item_category"
    projection_type = "ALL"
  }
}
