# Define scaling policies
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up"                        # Policy name
  scaling_adjustment     = 1                                 # Increase capacity by 1
  adjustment_type        = "ChangeInCapacity"                # Adjustment type
  cooldown               = 300                               # Cooldown period in seconds
  autoscaling_group_name = aws_autoscaling_group.app.name    # Associate with auto-scaling group
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down"                      # Policy name
  scaling_adjustment     = -1                                # Decrease capacity by 1
  adjustment_type        = "ChangeInCapacity"                # Adjustment type
  cooldown               = 300                               # Cooldown period in seconds
  autoscaling_group_name = aws_autoscaling_group.app.name    # Associate with auto-scaling group
}
