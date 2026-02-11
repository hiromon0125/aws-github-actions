variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
}

variable "public_availability_zone" {
  type        = string
  description = "Availability zone for the public subnet"
}

variable "private_availability_zone" {
  type        = string
  description = "Availability zone for the private subnet"
}

variable "route_table_cidr" {
  type        = string
  description = "CIDR block for route table to allow internet access"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used for naming resources"
}
