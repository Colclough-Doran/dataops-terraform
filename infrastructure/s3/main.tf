module "s3_bucket_dataops" {
  source = "../../modules/s3"

  bucket_name = "dataops-${var.aws_region}"
  environment = var.environment
  key_name = [
    "origin-data",
    "transformed-data"
  ]
}