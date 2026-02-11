variable "subnet_id" {
  type        = string
  description = "Subnet id for the EC2 instance"
}

variable "ec2_sg_id" {
  type        = string
  description = "Security group id for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "AWS key pair name"
}

variable "user_data" {
  type        = string
  description = "User data script content"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used for naming resources"
}
