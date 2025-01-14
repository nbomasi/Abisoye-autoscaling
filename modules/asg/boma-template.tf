# Data source for user data script
data "template_file" "user_data" {
  template = file("./modules/asg/user_data.sh")
}

resource "aws_launch_template" "prometheus_grafana_lt" {
  name          = "prometheus-grafana-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  # Block device mappings (root volume configuration)
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.root_volume_size # Size in GB
      volume_type           = var.root_volume_type # General Purpose SSD (gp2), Provisioned IOPS SSD (io1), etc.
      delete_on_termination = true                 # Whether the volume is deleted on instance termination
    }
  }

  # Network interfaces
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.prometheus_grafana_sg.id]
  }

  # User data for server setup
  user_data = base64encode(data.template_file.user_data.rendered)

  # Enable detailed monitoring
  monitoring {
    enabled = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
