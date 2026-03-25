variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "contact-handler"
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "python3.11"
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
  default     = "code.lambda_handler"
}

variable "lambda_zip_path" {
  description = "Path to Lambda zip file"
  type        = string
  default     = "lambda/lambda.zip"
}

variable "log_retention_days" {
  description = "CloudWatch log retention"
  type        = number
  default     = 14
}

variable "lambda_role_arn" {
  description = "IAM role ARN assumed by the Lambda function"
  type        = string
}

variable "table_name" {
  description = "DynamoDB table name"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN"
  type        = string
}