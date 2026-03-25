variable "lambda_function_name" {
	description = "Lambda function name used to name the IAM role"
	type        = string
}

variable "dynamodb_table_arn" {
	description = "DynamoDB table ARN for Lambda policy"
	type        = string
}

variable "sns_topic_arn" {
	description = "SNS topic ARN for Lambda policy"
	type        = string
}
