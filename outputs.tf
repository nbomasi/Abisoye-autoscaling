output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = module.prometheus_grafana_asg.asg_name
}

output "launch_template_id" {
  description = "The ID of the Launch Template"
  value       = module.prometheus_grafana_asg.launch_template_id
}

# Output the public IPs
output "instance_public_ips" {
  description = "Public IP addresses of instances in the ASG"
  value       = module.prometheus_grafana_asg.instance_public_ips
}
