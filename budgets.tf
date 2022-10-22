
# * Creates a monthly limit budget and notification system
resource "aws_budgets_budget" "monthly-limit-budget" {
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
