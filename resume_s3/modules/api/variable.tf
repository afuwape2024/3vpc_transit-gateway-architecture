variable "api_name" {
  description = "Name of API Gateway"
  type        = string
  default     = "contact-api"
}

variable "route_key" {
  description = "API route"
  type        = string
  default     = "POST /contact"
}

variable "lambda_invoke_arn" {
  description = "Lambda invoke ARN for API Gateway integration"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda function name for invoke permission"
  type        = string
}