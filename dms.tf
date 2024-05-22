resource "aws_dms_replication_instance" "ambrose" {
  replication_instance_id   = "ambrose-dms"
  replication_instance_class = "dms.t3.micro"
  allocated_storage         = 50
  publicly_accessible       = true
}

resource "aws_dms_endpoint" "source" {
  endpoint_id   = "mysql-source"
  endpoint_type = "source"
  engine_name   = "mysql"
  username      = var.db_username
  password      = var.db_password
  server_name   = aws_db_instance.mysql.endpoint
  port          = 3306
  database_name = "mydatabase"
}

resource "aws_dms_endpoint" "target" {
  endpoint_id   = "postgresql-target"
  endpoint_type = "target"
  engine_name   = "postgres"
  username      = var.db_username
  password      = var.db_password
  server_name   = aws_db_instance.postgresql.endpoint
  port          = 5432
  database_name = "mydatabase"
}

resource "aws_dms_replication_task" "ambrose" {
  replication_task_id          = "ambrose-task"
  replication_instance_arn     = aws_dms_replication_instance.ambrose.replication_instance_arn
  source_endpoint_arn          = aws_dms_endpoint.source.endpoint_arn
  target_endpoint_arn          = aws_dms_endpoint.target.endpoint_arn
  migration_type               = "full-load-and-cdc"
  table_mappings               = <<EOF
{
  "rules": [{
    "rule-type": "selection",
    "rule-id": "1",
    "rule-name": "1",
    "object-locator": {
      "schema-name": "%",
      "table-name": "%"
    },
    "rule-action": "include"
  }]
}
EOF
  replication_task_settings = <<EOF
{
  "TargetMetadata": {
    "TargetSchema": "",
    "SupportLobs": true,
    "FullLobMode": false,
    "LobChunkSize": 64,
    "LimitedSizeLobMode": true,
    "LobMaxSize": 32,
    "InlineLobMaxSize": 0,
    "LoadMaxFileSize": 0,
    "ParallelLoadThreads": 0,
    "ParallelLoadBufferSize": 0,
    "BatchApplyEnabled": true,
    "TaskRecoveryTableEnabled": false
  }
}
EOF
}
