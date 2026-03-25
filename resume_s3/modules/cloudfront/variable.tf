variable "project_name" {
  description = "Project name"
  type        = string
}

variable "domain_name" {
  description = "Primary domain"
  type        = string
}

variable "alternate_domains" {
  description = "Additional domain aliases (e.g. www)"
  type        = list(string)
  default     = []
}

variable "default_root_object" {
  description = "Default root object"
  type        = string
  default     = "index.html"
}

variable "min_ttl" {
  type    = number
  default = 0
}

variable "default_ttl" {
  type    = number
  default = 3600
}

variable "max_ttl" {
  type    = number
  default = 86400
}

variable "website_endpoint" {
  description = "S3 static website endpoint"
  type        = string
}

variable "acm_certificate_arn" {
  description = "Validated ACM certificate ARN for CloudFront"
  type        = string
}