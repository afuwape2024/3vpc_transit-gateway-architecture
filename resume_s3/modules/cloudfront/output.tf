output "cloudfront_domain_name" {
  description = "CloudFront distribution domain"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "cloudfront_hosted_zone_id" {
  description = "CloudFront hosted zone ID (used for Route53)"
  value       = aws_cloudfront_distribution.cdn.hosted_zone_id
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.cdn.id
}

output "website_url" {
  description = "Final website URL"
  value       = "https://${var.domain_name}"
}