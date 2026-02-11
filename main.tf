terraform {
  backend "s3" {
    bucket = "hiro-terraform-activity-bucket"
    key    = "activity-prod/terraform.tfstate"
    region = "us-east-1"
  }
}

# Provider Configuration
provider "aws" {
  region = "us-east-1"
}

locals {
  name_prefix = "${var.name_prefix}-${terraform.workspace}"
}

module "wp_network" {
  source                    = "./modules/network"
  vpc_cidr                  = var.vpc_cidr
  public_subnet_cidr        = var.public_subnet_cidr
  private_subnet_cidr       = var.private_subnet_cidr
  public_availability_zone  = var.public_availability_zone
  private_availability_zone = var.private_availability_zone
  route_table_cidr          = var.route_table_cidr
  name_prefix               = local.name_prefix
}

module "security" {
  source              = "./modules/security"
  vpc_id              = module.wp_network.vpc_id
  name_prefix         = local.name_prefix
  ec2_sg_ingress_cidr = var.ec2_sg_ingress_cidr
  ec2_sg_egress_cidr  = var.ec2_sg_egress_cidr
}

module "compute" {
  source        = "./modules/compute"
  subnet_id     = module.wp_network.public_subnet_id
  ec2_sg_id     = module.security.ec2_id
  instance_type = var.ec2_instance_type
  key_name      = var.aws_key_name
  user_data = templatefile("wp_rds_install.sh", {
    db_name     = var.db_name
    db_username = var.db_username
    db_password = var.db_password
    db_endpoint = module.database.endpoint
  })
  name_prefix = local.name_prefix
}

module "database" {
  source               = "./modules/database"
  subnet_ids           = [module.wp_network.private_subnet_id, module.wp_network.public_subnet_id]
  rds_sg_id            = module.security.rds_id
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_instance_type     = var.db_instance_type
  db_allocated_storage = var.db_allocated_storage
  db_storage_type      = var.db_storage_type
  name_prefix          = local.name_prefix
}
