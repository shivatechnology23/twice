resource "aws_cloudwatch_log_group" "rds_log_group" {
  name              = "/aws/rds/instance/logs"
  retention_in_days = 30
}
