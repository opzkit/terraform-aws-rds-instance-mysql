resource "aws_db_subnet_group" "default" {
  name       = "${var.identifier}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.identifier} DB subnet group"
  }
}

data "aws_security_group" "security_groups" {
  for_each = toset(var.security_group_names)
  name     = each.value
}

resource "aws_security_group" "allow_mysql" {
  vpc_id = var.vpc_id
  name   = "allow-mysql-${var.identifier}"

  ingress {
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = [for i, g in data.aws_security_group.security_groups : g.id]
  }

  egress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = [for i, g in data.aws_security_group.security_groups : g.id]
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
  monitoring_interval         = var.enhanced_monitoring ? 60 : 0
  maintenance_window          = "mon:02:00-mon:03:30"
  backup_window               = "03:30-05:00"
  backup_retention_period     = 14
  allow_major_version_upgrade = true
  apply_immediately           = var.apply_immediately
  db_subnet_group_name        = aws_db_subnet_group.default.name
  storage_encrypted           = var.storage_encrypted
}
