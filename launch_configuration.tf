# Create a launch configuration for the auto-scaling group
resource "aws_launch_configuration" "app" {
  name          = "app-launch-configuration"  # Name of the launch configuration
  image_id      = var.ami                     # AMI ID for the instances
  instance_type = var.instance_type           # Instance type
  key_name      = var.key_name                # Key pair for SSH access

  lifecycle {
    create_before_destroy = true  # Ensure launch configuration is created before old one is destroyed
  }
}
