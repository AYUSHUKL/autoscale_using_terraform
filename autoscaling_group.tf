# Create an auto-scaling group
resource "aws_autoscaling_group" "app" {
  launch_configuration = aws_launch_configuration.app.id  # Use the launch configuration
  min_size             = 1                                 # Minimum number of instances
  max_size             = 5                                 # Maximum number of instances
  desired_capacity     = 2                                 # Desired number of instances
  vpc_zone_identifier  = ["subnet-12345678", "subnet-87654321"]  # Subnets for the auto-scaling group

  tag {
    key                 = "Name"              # Tag key
    value               = "app-instance"      # Tag value
    propagate_at_launch = true                # Apply tag to instances at launch
  }

  health_check_type         = "EC2"           # Health check type
  health_check_grace_period = 300             # Grace period for health checks

  target_group_arns = [aws_lb_target_group.app.arn]  # Associate with load balancer target group
}
