resource "aws_db_instance" "mysql" {
  identifier        = "mysql-instance"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  username          = var.db_username
  password          = var.db_password
  db_subnet_group_name = "my-db-subnet-group"
  skip_final_snapshot = true

  monitoring_interval = 60
  enabled_cloudwatch_logs_exports = ["error", "general", "slowquery"]
}

resource "aws_db_instance" "postgresql" {
  identifier        = "postgresql-instance"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "postgres"
  engine_version    = "13.3"
  instance_class    = "db.t3.micro"
  username          = var.db_username
  password          = var.db_password
  db_subnet_group_name = "my-db-subnet-group"
  skip_final_snapshot = true

  monitoring_interval = 60
  enabled_cloudwatch_logs_exports = ["postgresql"]
}
