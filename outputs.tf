output "database_secret_name" {
  value = aws_secretsmanager_secret.rds_secret.name
}
