output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "keys" {
  value = [for obj in aws_s3_object.this : obj.key]
}