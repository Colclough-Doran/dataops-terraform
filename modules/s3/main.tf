resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_object" "this" {
  for_each = toset(var.key_name)

  key    = "${each.key}/"
  bucket = aws_s3_bucket.this.bucket
}