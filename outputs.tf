output "mysql_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "postgresql_endpoint" {
  value = aws_db_instance.postgresql.endpoint
}

output "dms_replication_instance_arn" {
  value = aws_dms_replication_instance.ambrose.replication_instance_arn
}
