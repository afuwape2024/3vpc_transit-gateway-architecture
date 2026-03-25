variable "domain_name" {
	description = "Primary domain name"
	type        = string
}

variable "alternate_domains" {
	description = "Additional domain names for ACM SANs"
	type        = list(string)
	default     = []
}
