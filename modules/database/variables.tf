variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ids for the DB subnet group"
}

variable "rds_sg_id" {
  type        = string
  description = "Security group id for the RDS instance"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_username" {
  type        = string
  description = "Database admin username"
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "Database admin password"
  sensitive   = true
}

variable "db_instance_type" {
  type        = string
  description = "RDS instance class"
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage (GB)"
}

variable "db_storage_type" {
  type        = string
  description = "RDS storage type"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used for naming resources"
}
