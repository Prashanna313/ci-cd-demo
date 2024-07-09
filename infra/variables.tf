variable "account_id" {
  type        = string
  description = "(Required) The account in which the resources needs to be deployed"
}

variable "app" {
  type        = string
  description = "(optional) The app in which the resources are associated, by default app-A"
  default     = "app-A"
}

variable "cost_center" {
  type        = string
  description = "(optional) The CostCenter in which the resources needs to be tagged, by default division-A"
  default     = "Business-1"
}

variable "environment" {
  type        = string
  description = "(optional) The Environment in which the resources needs to be deployed, by default dev"
  default     = "dev"
}


variable "region" {
  type        = string
  description = "(Required) The AWS region in which the resources needs to be deployed"
  default     = "ap-south-1"
}

variable "state_bucket_name" {
  type        = string
  description = "(Required) The S3 bucket in which state file is stored"
}

variable "state_object_key" {
  type        = string
  description = "(Required) The S3 object key in which state file is stored"
}