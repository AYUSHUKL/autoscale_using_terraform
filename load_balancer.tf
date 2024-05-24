# Create a load balancer
resource "aws_lb" "app" {
  name               = "app-load-balancer"      # Name of the load balancer
  internal           = false                    # Internet-facing load balancer
  load_balancer_type = "application"            # Application load balancer
  security_groups    = [aws_security_group.lb.id]  # Security group
  subnets            = ["subnet-12345678", "subnet-87654321"]  # Subnets

  enable_deletion_protection = true             # Enable deletion protection
}
