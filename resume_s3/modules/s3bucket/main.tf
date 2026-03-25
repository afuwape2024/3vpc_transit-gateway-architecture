resource "aws_s3_bucket" "site" {
    bucket = var.tobi_file
    tags = {
        Name = var.tobi_file
    }
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }
  # error_document { key = "index.html" }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public" {
  bucket = aws_s3_bucket.site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = "*"
      Action = ["s3:GetObject"]
      Resource = "${aws_s3_bucket.site.arn}/*"
    }]
  })
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.site.id
  key          = "index.html"
  source       = "${path.module}/../html/index.html"
  content_type = "text/html"

  etag = filemd5("${path.module}/../html/index.html")
}