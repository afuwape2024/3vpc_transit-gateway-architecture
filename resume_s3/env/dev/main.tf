module "s3_bucket" {
    source    = "../../modules/s3bucket"
    tobi_file = var.tobi_file
}

module "route53" {
    source            = "../../modules/route53"
    domain_name       = var.domain_name
    alternate_domains = var.alternate_domains
}

module "cloudfront" {
    source            = "../../modules/cloudfront"
    project_name      = var.project_name
    domain_name       = var.domain_name
    alternate_domains = var.alternate_domains
    default_ttl       = var.default_ttl
    max_ttl           = var.max_ttl
    website_endpoint  = module.s3_bucket.website_endpoint
    acm_certificate_arn = module.route53.certificate_arn
}

module "sns" {
    source = "../../modules/sns"
    email  = var.email
}

module "iam" {
    source             = "../../modules/iam"
    lambda_function_name = var.lambda_function_name
    dynamodb_table_arn = module.dynamodb.table_arn
    sns_topic_arn      = module.sns.topic_arn
}

module "lambda" {
    source               = "../../modules/lambda"
    lambda_function_name = var.lambda_function_name
    log_retention_days   = var.log_retention_days
    lambda_role_arn      = module.iam.lambda_role_arn
    table_name           = module.dynamodb.table_name
    sns_topic_arn        = module.sns.topic_arn
}

module "dynamodb" {
    source = "../../modules/dynamodb"
}

module "api" {
    source               = "../../modules/api"
    lambda_invoke_arn    = module.lambda.lambda_invoke_arn
    lambda_function_name = module.lambda.lambda_function_name
}

data "aws_route53_zone" "main" {
    name         = var.domain_name
    private_zone = false
}

resource "aws_route53_record" "apex_alias" {
    zone_id = data.aws_route53_zone.main.zone_id
    name    = var.domain_name
    type    = "A"

    alias {
        name                   = module.cloudfront.cloudfront_domain_name
        zone_id                = module.cloudfront.cloudfront_hosted_zone_id
        evaluate_target_health = false
    }
}

resource "aws_route53_record" "www_alias" {
    zone_id = data.aws_route53_zone.main.zone_id
    name    = "www.${var.domain_name}"
    type    = "A"

    alias {
        name                   = module.cloudfront.cloudfront_domain_name
        zone_id                = module.cloudfront.cloudfront_hosted_zone_id
        evaluate_target_health = false
    }
}
