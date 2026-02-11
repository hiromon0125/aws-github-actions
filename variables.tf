variable "db_username" {
  description = "The username for the RDS database"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}

variable "aws_key_name" {
  description = "The name of the AWS key pair for SSH access to the EC2 instance"
  type        = string
  sensitive   = true
}

variable "ec2_sg_ingress_cidr" {
  description = "List of CIDR blocks to allow ingress to EC2 instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "ec2_sg_egress_cidr" {
  description = "List of CIDR blocks to allow egress from EC2 instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "route_table_cidr" {
  description = "CIDR block for route table to allow internet access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ec2_instance_type" {
  description = "The instance type for the WordPress EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "db_instance_type" {
  description = "The instance type for the RDS database"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the WordPress database"
  type        = string
  default     = "wordpressdb"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS database in GB"
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "The storage type for the RDS database"
  type        = string
  default     = "gp2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "private_availability_zone" {
  description = "Availability zone for the private subnet"
  type        = string
  default     = "us-east-1b"
}

variable "name_prefix" {
  description = "Base prefix used for resource naming"
  type        = string
  default     = "wp"
}
