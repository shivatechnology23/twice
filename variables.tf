variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "terraform_state_bucket" {
  description = "The S3 bucket to store Terraform state"
  type        = string
  default     = "terraform-state-bucket-11"
}

variable "db_username" {
  description = "The database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The database password"
  type        = string
  default     = "Database@123"
  sensitive   = true
}
