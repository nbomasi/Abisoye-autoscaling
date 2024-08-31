provider "aws" {
  region = "eu-north-1"
}

module "prometheus_grafana_asg" {
  source = "./modules/asg"

  vpc_id               = var.vpc_id
  ami_id               = var.ami_id
  asg_desired_capacity = var.asg_desired_capacity
  asg_max_size         = var.asg_max_size # Ensure this is set appropriately
  health_check_type    = var.health_check_type
  instance_type        = var.instance_type
  root_volume_size     = var.root_volume_size
  root_volume_type     = var.root_volume_type
  subnet_ids           = var.subnet_ids
  asg_min_size         = var.asg_min_size
}
