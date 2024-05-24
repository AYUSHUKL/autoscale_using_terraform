# Create a listener for the load balancer
resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.arn            # Load balancer ARN
  port              = 80                        # Listener port
  protocol          = "HTTP"                    # Protocol

  default_action {
    type             = "forward"                # Action type
    target_group_arn = aws_lb_target_group.app.arn  # Target group ARN
  }
}
