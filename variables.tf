variable "datadog_api_key" {
  type        = string
  description = "The API Key for Datadog"
}

variable "datadog_firehose_endpoint" {
  type        = string
  description = "Datadog Kinesis Firehose Endpoint"
  default     = "https://awsmetrics-intake.datadoghq.com/v1/input"

  validation {
    condition = contains([
      "https://awsmetrics-intake.datadoghq.com/v1/input",
      "https://awsmetrics-intake.datadoghq.eu/v1/input",
    ], var.datadog_firehose_endpoint)

    error_message = "Invalid Datadog Kinesis Firehose endpoint."
  }
}

variable "kinesis_firehose_delivery_stream_name" {
  type        = string
  default     = "datadog"
  description = "The name of Kinesis Firehose"
}

variable "cloudwatch_log_group_name" {
  type        = string
  default     = "datadog-metric-stream"
  description = "The name of the CloudWatch log group"
}

variable "cloudwatch_metric_stream_name" {
  type        = string
  default     = "datadog"
  description = "The name of the CloudWatch Metric Stream"
}

variable "cloudwatch_metric_stream_output_format" {
  type        = string
  default     = "opentelemetry0.7"
  description = "The output fotmat of the CloudWatch Metric Stream"

  validation {
    condition     = contains(["opentelemetry0.7", "json"], var.cloudwatch_metric_stream_output_format)
    error_message = "Allowed values for input_parameter are \"opentelemetry0.7\", \"json\"."
  }
}

variable "aws_iam_role_datadog_metric_stream_name" {
  type        = string
  default     = "DatadogMetricStreamRole"
  description = "The name of the IAM Role for Datadog Metric Stream"
}

variable "aws_iam_role_datadog_firehose_name" {
  type        = string
  default     = "DatadogFirehoseRole"
  description = "The name of the IAM Role for Kinesis Firehose"
}

variable "aws_iam_role_policy_datadog_metric_stream_firehose_name" {
  type        = string
  default     = "DatadogMetricStreamFirehosePolicy"
  description = "The name of the IAM Role Policy for Metric Stream to allow PutRecords to Firehose"
}

variable "aws_iam_role_policy_datadog_firehose_s3_backup_name" {
  type        = string
  default     = "DatadogFirehoseS3BackupPolicy"
  description = "The name of the IAM Role Policy for Firehose to allow PutObject to Firehose"
}

variable "s3_bucket_firehose_backup" {
  type        = string
  description = "The name of the S3 bucket for backup"
}

variable "s3_bucket_backup_prefix" {
  type        = string
  default     = "metrics/"
  description = "The prefix of the S3 bucket for backup"
}

variable "metric_stream_namespace_list" {
  type        = list(string)
  default     = []
  description = "The list of the namespaces for CloudWatch Metric Stream"
}
