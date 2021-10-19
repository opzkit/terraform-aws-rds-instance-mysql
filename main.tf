resource "aws_db_subnet_group" "default" {
  name       = "${var.identifier}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.identifier} DB subnet group"
  }
}

resource "aws_security_group" "allow_mysql" {
  vpc_id = var.vpc.id
  name   = "allow-mysql-${var.identifier}"

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [var.vpc.cidr_block]
  }
}

resource "aws_db_instance" "default" {
  instance_class              = var.instance_type
  engine_version              = var.mysql_version
  max_allocated_storage       = 60
  skip_final_snapshot         = var.skip_final_snapshot
  identifier                  = var.identifier
  name                        = var.db_name
  username                    = var.master_username
  password                    = local.password
  maintenance_window          = "mon:02:00-mon:03:30"
  backup_window               = "03:30-05:00"
  backup_retention_period     = 14
  allow_major_version_upgrade = true
  apply_immediately           = var.apply_immediately
  db_subnet_group_name        = aws_db_subnet_group.default.name
}
