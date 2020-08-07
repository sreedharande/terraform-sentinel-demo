variable "bucket" {
  description = "The name of the bucket. If we do not define the name of the bucket, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "acl" {
  description = "Defaults to 'private'."
  type        = string
  default     = "private"
}
