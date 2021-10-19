output "database_secret_name" {
  value = aws_secretsmanager_secret.rds_secret.name
}

output "security_group" {
  value = aws_security_group.allow_mysql
}
