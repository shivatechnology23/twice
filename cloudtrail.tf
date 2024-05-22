resource "aws_cloudtrail" "main" {
  name                          = "main"
  s3_bucket_name                = "cloudtrail-logs-bucket-11"
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
}
