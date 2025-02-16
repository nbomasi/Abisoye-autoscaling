resource "aws_autoscaling_group" "prometheus_grafana_asg" {
  launch_template {
    id      = aws_launch_template.prometheus_grafana_lt.id
    version = "$Latest"
  }

  min_size         = var.asg_min_size
  desired_capacity = var.asg_desired_capacity
  max_size         = var.asg_desired_capacity

  vpc_zone_identifier = var.subnet_ids

  #target_group_arns = [var.target_group_arn] # Optional: If you're attaching this ASG to a load balancer

  # Health check settings
  health_check_type         = var.health_check_type
  health_check_grace_period = 300


  # Optional: Scaling policies can be added here
  tag {
    key                 = "Name"
    value               = "Prometheus-Grafana-Instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
