output "staticweb_bucket" {
    value = aws_s3_bucket.site.id
}

output "website_endpoint" {
    value = aws_s3_bucket_website_configuration.site.website_endpoint
}

output "bucket_arn" {
    value = aws_s3_bucket.site.arn
}

output "public_access_block" {
    value = aws_s3_bucket_public_access_block.site.id
}

output "staticweb_bucket_website" {
    value = aws_s3_bucket_website_configuration.site.id
}

output "public_read" {
    value = aws_s3_bucket_policy.public.id
}