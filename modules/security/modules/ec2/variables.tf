variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used for naming resources"
}

variable "ingress_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for security group ingress rules"
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for security group egress rules"
  default     = ["0.0.0.0/0"]
}

# more difficult than I expected to conditionally add rules based on variables,
# so commenting out for now and will revisit if time allows
# variable "enable_ssh" {
#   type        = bool
#   description = "Whether to allow SSH access to the EC2 instance"
#   default     = true
# }

# variable "enable_http" {
#   type        = bool
#   description = "Whether to allow HTTP access to the EC2 instance"
#   default     = true
# }
