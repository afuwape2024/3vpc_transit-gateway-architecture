variable "tobi_file" {
    default = "oluwagbenroafuwape.com"
}

variable "bucket_name" {}

variable "region" {
    default = "us-east-1"
}

variable "email" {}

variable "project_name" {}

variable "domain_name" {}

variable "alternate_domains" {
    type    = list(string)
    default = []
}

variable "default_ttl" {
    type    = number
    default = 3600
}

variable "max_ttl" {
    type    = number
    default = 86400
}

variable "lambda_function_name" {}

variable "log_retention_days" {
    type    = number
    default = 14
}