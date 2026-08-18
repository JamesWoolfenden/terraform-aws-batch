data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_kms_key" "batch_logs" {
  description             = "CMK for AWS Batch job definition ${var.job_name}'s CloudWatch log group"
  enable_key_rotation     = true
  deletion_window_in_days = 30

  lifecycle {
    prevent_destroy = true
  }

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "EnableRootAccountPermissions"
        Effect    = "Allow"
        Principal = { AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" }
        Action    = "kms:*"
        Resource  = "*"
      },
      {
        Sid    = "AllowCloudWatchLogsUseOfKey"
        Effect = "Allow"
        Principal = {
          Service = "logs.${data.aws_region.current.region}.amazonaws.com"
        }
        Action = [
          "kms:Encrypt*",
          "kms:Decrypt*",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:Describe*",
        ]
        Resource = "*"
        Condition = {
          ArnLike = {
            "kms:EncryptionContext:aws:logs:arn" = "arn:aws:logs:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/batch/${var.job_name}"
          }
        }
      },
    ]
  })
}

resource "aws_kms_alias" "batch_logs" {
  name          = "alias/batch-${var.job_name}-logs"
  target_key_id = aws_kms_key.batch_logs.key_id
}

resource "aws_cloudwatch_log_group" "batch" {
  name              = "/aws/batch/${var.job_name}"
  retention_in_days = var.log_retention_days
  kms_key_id        = aws_kms_key.batch_logs.arn
}

resource "aws_batch_job_definition" "batch" {
  name                 = var.job_name
  type                 = var.job_type
  container_properties = local.container_properties
  parameters           = var.parameters

  retry_strategy {
    attempts = 3
  }

  timeout {
    attempt_duration_seconds = 3600
  }
}
