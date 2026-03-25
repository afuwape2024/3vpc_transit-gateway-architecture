output "api_endpoint" {
  value = aws_apigatewayv2_api.api.api_endpoint
}

output "contact_url" {
  value = "${aws_apigatewayv2_api.api.api_endpoint}/contact"
}