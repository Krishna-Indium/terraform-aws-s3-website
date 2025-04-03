# Input variable definitions

variable "bucket_name" {
  description = "Name of the S3 bucket. Must be Unique across AWS"
  type        = string
  default     = kaja-bucket-0192838
}

variable "tags" {
  description = "Tages to set on the bucket"
  type        = map(string)
  default     = {}
}
