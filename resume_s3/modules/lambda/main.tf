terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
  }
}

data "archive_file" "contact_package" {
  type        = "zip"
  source_file = "${path.module}/code.py"
  output_path = "${path.module}/build/contact.zip"
}

resource "aws_lambda_function" "contact" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime

  filename         = data.archive_file.contact_package.output_path
  source_code_hash = data.archive_file.contact_package.output_base64sha256

  environment {
    variables = {
      TABLE_NAME    = var.table_name
      SNS_TOPIC_ARN = var.sns_topic_arn
    }
  }
}