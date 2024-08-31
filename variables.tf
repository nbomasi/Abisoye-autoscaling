variable "ami_id" {
  type        = string
  description = "The ID of the Ubuntu AMI to use"
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance type"

}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to launch the instances in"


}

variable "asg_min_size" {
  type        = number
  description = "Minimum size of the Auto Scaling Group"

}

variable "asg_max_size" {
  type        = number
  description = "Maximum size of the Auto Scaling Group"

}

variable "asg_desired_capacity" {
  type        = number
  description = "Desired capacity of the Auto Scaling Group"

}

variable "vpc_id" {
  type = string
}


variable "root_volume_size" {
  type = number

}

variable "root_volume_type" {
  type = string

}

variable "health_check_type" {
  type = string

}