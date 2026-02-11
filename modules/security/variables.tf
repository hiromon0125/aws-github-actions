variable "name_prefix" {
  type        = string
  description = "Prefix used for naming resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "ec2_sg_ingress_cidr" {
  type        = list(string)
  description = "List of CIDR blocks to allow ingress to EC2 instance"
  default     = ["0.0.0.0/0"]
}

variable "ec2_sg_egress_cidr" {
  type        = list(string)
  description = "List of CIDR blocks to allow egress from EC2 instance"
  default     = ["0.0.0.0/0"]
}
