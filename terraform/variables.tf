variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "seif-s3-bucket"
  type        = string
}

variable "project_name" {
  description = "Nom du projet"
  type        = string
  default     = "static-site"
}