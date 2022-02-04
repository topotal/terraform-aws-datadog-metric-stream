resource "aws_kinesis_firehose_delivery_stream" "datadog" {
  name        = var.kinesis_firehose_delivery_stream_name
  destination = "http_endpoint"

  http_endpoint_configuration {
    name               = "Datadog"
    access_key         = var.datadog_api_key
    buffering_interval = 60
    buffering_size     = 4
    retry_duration     = 60
    role_arn           = aws_iam_role.datadog-firehose.arn
    s3_backup_mode     = "FailedDataOnly"
    url                = var.datadog_firehose_endpoint

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = aws_cloudwatch_log_group.datadog-metric-stream.name
      log_stream_name = aws_cloudwatch_log_stream.datadog-metric-stream-http_endpoint_delivery.name
    }

    processing_configuration {
      enabled = false
    }

    request_configuration {
      content_encoding = "GZIP"
    }
  }

  s3_configuration {
    bucket_arn      = aws_s3_bucket.datadog-firehose-backup.arn
    buffer_interval = 300
    buffer_size     = 5
    prefix          = var.s3_bucket_backup_prefix
    role_arn        = aws_iam_role.datadog-firehose.arn

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = aws_cloudwatch_log_group.datadog-metric-stream.name
      log_stream_name = aws_cloudwatch_log_stream.datadog-metric-stream-s3_backup.name
    }
  }

  server_side_encryption {
    enabled = false
  }
}
