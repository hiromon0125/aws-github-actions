resource "aws_security_group" "rds" {
  name        = "${var.name_prefix}-rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.ingress_sg_ids
  }
}
