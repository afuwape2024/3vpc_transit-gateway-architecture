
resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = var.website_endpoint
    origin_id   = "${var.project_name}-origin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.default_root_object

  aliases = concat([var.domain_name], var.alternate_domains)

  default_cache_behavior {
    target_origin_id       = "${var.project_name}-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }

    min_ttl     = var.min_ttl
    default_ttl = var.default_ttl
    max_ttl     = var.max_ttl
  }

  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/${var.default_root_object}"
  }

  custom_error_response {
    error_code         = 404
    response_code      = 200
    response_page_path = "/${var.default_root_object}"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }

  tags = {
    Name = "${var.project_name}-cdn"
  }
}