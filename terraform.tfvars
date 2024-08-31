
# ASG Configuration
instance_type        = "t3.medium"
asg_min_size         = 1
asg_max_size         = 5
asg_desired_capacity = 1                                                        # Replace with your key pair name
vpc_id               = "vpc-06e548fbb9b68461d"                                  # Replace with your VPC ID
subnet_ids           = ["subnet-0062214eb488e559a", "subnet-0afa78632f440713e"] # Replace with your subnet IDs

# AMI IDs for Prometheus and Grafana
ami_id = "ami-07c8c1b18ca66bb07" # Replace with the AMI ID 

# Additional configurations
root_volume_size  = 20
root_volume_type  = "gp2"
health_check_type = "EC2"



