variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-northeast-1"
}

variable "function_name" {
  description = "Lambda function name"
  type        = string
  default     = "MirroringTWDrugDataToS3"
}

variable "lambda_zip_path" {
  description = "Path to the deployment zip file"
  type        = string
  default     = "../a.zip"
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "nodejs20.x"
}

variable "handler" {
  description = "Lambda handler"
  type        = string
  default     = "index.handler"
}

variable "timeout_seconds" {
  description = "Lambda timeout in seconds"
  type        = number
  default     = 60
}

variable "memory_size" {
  description = "Lambda memory size in MB"
  type        = number
  default     = 256
}

variable "log_retention_days" {
  description = "CloudWatch log retention in days"
  type        = number
  default     = 14
}



variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "enable_schedule" {
  description = "Enable EventBridge schedule to invoke the Lambda"
  type        = bool
  default     = true
}

variable "schedule_expression" {
  description = "EventBridge schedule expression (e.g. rate(1 day) or cron(...))"
  type        = string
  default     = "cron(*/10 * * * ? *)"
}
