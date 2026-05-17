output "dataops_name" {
  value = module.s3_bucket_dataops.bucket_name
}

output "dataops_arn" {
  value = module.s3_bucket_dataops.bucket_arn
}

output "dataops_key_origin" {
  value = module.s3_bucket_dataops.keys[0]
}

output "dataops_key_transformed" {
  value = module.s3_bucket_dataops.keys[1]
}