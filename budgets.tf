
# > AWS Budgets
# * Creates a monthly limit budget and notification system
resource "aws_budgets_budget" "aws_monthly_limit_budget" {
  name              = "monthly-limit-budget"
  budget_type       = "COST"
  limit_amount      = "5"
  limit_unit        = "USD"
  time_period_end   = "2080-01-01_00:00"
  time_period_start = "2022-01-01_00:00"
  time_unit         = "MONTHLY"

  # * Actual budget notification
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 50
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["mervinhemaraju16@gmail.com"]
  }

  # * Forecasted budget notifications
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 90
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["mervinhemaraju16@gmail.com"]
  }
}

# * Creates a zero spend budget and notification system
resource "aws_budgets_budget" "aws_zero_spend_budget" {
  name              = "zero-spend-budget"
  budget_type       = "COST"
  limit_amount      = "1"
  limit_unit        = "USD"
  time_period_end   = "2080-01-01_00:00"
  time_period_start = "2022-01-01_00:00"
  time_unit         = "MONTHLY"

  # * Actual budget notification
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 0
    threshold_type             = "ABSOLUTE_VALUE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["mervinhemaraju16@gmail.com"]
  }
}

# > OCI Budgets
resource "oci_budget_budget" "oci_zero_spend_budget" {
  compartment_id = var.compartment_root_id
  amount         = 1
  reset_period   = "MONTHLY"

  description  = "A zero spend budget for OCI"
  display_name = "zero-spend-budget"
  target_type  = "COMPARTMENT"
  targets      = [var.compartment_production_id]
}

resource "oci_budget_alert_rule" "oci_zsb_rule" {
  budget_id      = oci_budget_budget.oci_zero_spend_budget.id
  threshold      = 0.1
  threshold_type = "ABSOLUTE"
  type           = "ACTUAL"

  display_name = "0-strict-threshold"
  message      = "The zer budget spend has been breached on OCI"
  recipients   = "mervinhemaraju16@gmail.com"

  depends_on = [
    oci_budget_budget.oci_zero_spend_budget
  ]
}
