output "lambda_function_name" {
  description = "Lambda function name"
  value       = aws_lambda_function.contact.function_name
}

output "lambda_arn" {
  description = "Lambda ARN"
  value       = aws_lambda_function.contact.arn
}

output "lambda_invoke_arn" {
  description = "Lambda invoke ARN (used by API Gateway)"
  value       = aws_lambda_function.contact.invoke_arn
}
