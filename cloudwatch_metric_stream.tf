resource "aws_cloudwatch_metric_stream" "datadog" {
  name          = var.cloudwatch_metric_stream_name
  firehose_arn  = aws_kinesis_firehose_delivery_stream.datadog.arn
  output_format = var.cloudwatch_metric_stream_output_format
  role_arn      = aws_iam_role.datadog-metric-stream.arn
}
