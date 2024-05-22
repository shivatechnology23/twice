provider "aws" {
  region = var.aws_region
}


module "rds" {
  source = "./modules/rds"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}

module "cloudtrail" {
  source = "./modules/cloudtrail"
}

module "dms" {
  source = "./modules/dms"
}
