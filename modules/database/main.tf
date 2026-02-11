resource "aws_db_subnet_group" "this_db" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name_prefix}-db-subnet-group"
  }
}

resource "aws_db_instance" "this_db" {
  identifier             = "${var.name_prefix}-db"
  allocated_storage      = var.db_allocated_storage
  storage_type           = var.db_storage_type
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_type
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.rds_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.this_db.name
}
