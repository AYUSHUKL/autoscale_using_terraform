# Create a target group for the load balancer
resource "aws_lb_target_group" "app" {
  name     = "app-target-group"                 # Target group name
  port     = 80                                 # Port for the target group
  protocol = "HTTP"                             # Protocol
  vpc_id   = "vpc-12345678"                     # VPC ID

  health_check {
    interval            = 30                    # Interval between health checks
    path                = "/health"             # Health check path
    timeout             = 5                     # Health check timeout
    healthy_threshold   = 2                     # Healthy threshold
    unhealthy_threshold = 2                     # Unhealthy threshold
    matcher             = "200"                 # Expected status code
  }
}
