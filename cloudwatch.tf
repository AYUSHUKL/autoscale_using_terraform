# Create a CloudWatch alarm for high CPU utilization
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name                = "high-cpu"                        # Alarm name
  comparison_operator       = "GreaterThanOrEqualToThreshold"   # Comparison operator
  evaluation_periods        = "2"                               # Evaluation periods
  metric_name               = "CPUUtilization"                  # Metric name
  namespace                 = "AWS/EC2"                         # Namespace
  period                    = "120"                             # Period in seconds
  statistic                 = "Average"                         # Statistic type
  threshold                 = "75"                              # Threshold
  alarm_description         = "This metric monitors high CPU utilization"  # Description
  alarm_actions             = [aws_sns_topic.alerts.arn]        # Actions on alarm
  dimensions                = {
    AutoScalingGroupName = aws_autoscaling_group.app.name       # Dimension
  }
}

# Create an SNS topic for alerts
resource "aws_sns_topic" "alerts" {
  name = "alerts"                           # SNS topic name
}

# Subscribe an email endpoint to the SNS topic
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn     # SNS topic ARN
  protocol  = "email"                      # Subscription protocol
  endpoint  = "alert@example.com"          # Email endpoint
}
