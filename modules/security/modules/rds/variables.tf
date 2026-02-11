variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used for naming resources"
}

variable "ingress_sg_ids" {
  type        = list(string)
  description = "List of security group IDs to allow ingress to RDS instance"
}
