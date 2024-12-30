variable "region" {
  type        = any
  default     = "us-east-1"
  description = "value of the region where the resources will be created"
}

variable "environments" {
  type = any
  default = "default"
  description = "The environment configuration"
}
