variable "bucket_name" {
  description = "The name of the s3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment the bucket is created in"
  type        = string
}

variable "key_name" {
  description = "The name of the bucket key(s)"
  type        = list(string)
}