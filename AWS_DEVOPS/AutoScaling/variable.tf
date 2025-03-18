variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling group"
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling group"
  default     = 3
}

variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling group"
  default     = 1
}

variable "availability_zone" {
  description = "The availability zone to use for the subnets"
  type        = string
  default     = "us-west-2a"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
  default     = "ami-00c257e12d6828491"
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the Auto Scaling group"
  type        = list(string)
  default     = ["subnet-0462267a125c8ee4a", "subnet-077741e6e120e850e"]  # Replace with actual subnet IDs
}

variable "cpu_threshold" {
  description = "The CPU utilization threshold for scaling out"
  type        = number
  default     = 80
}

variable "cpu_threshold_low" {
  description = "The CPU utilization threshold for scaling in"
  type        = number
  default     = 20
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "default_subnet_id" {
  description = "The default subnet ID"
  type        = string
  default     = "subnet-0145df4fae7132fc2"  # Replace with actual default subnet ID
}