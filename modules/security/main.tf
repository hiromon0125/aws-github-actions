module "ec2_sg" {
  source       = "./modules/ec2"
  vpc_id       = var.vpc_id
  name_prefix  = var.name_prefix
  ingress_cidr = var.ec2_sg_ingress_cidr
  egress_cidr  = var.ec2_sg_egress_cidr
}

module "rds_sg" {
  source         = "./modules/rds"
  vpc_id         = var.vpc_id
  name_prefix    = var.name_prefix
  ingress_sg_ids = [module.ec2_sg.id]
}
