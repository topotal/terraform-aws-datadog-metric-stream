# terraform-aws-datadog-metric-stream

Terraform module for creating required AWS resources to support Datadog [AWS CloudWatch Metric Streams with Kinesis Data Firehose](https://docs.datadoghq.com/integrations/guide/aws-cloudwatch-metric-streams-with-kinesis-data-firehose/?tab=cloudformation)

https://registry.terraform.io/modules/topotal/datadog-metric-stream/aws/latest

## Usage

Copy and paste into your Terraform configuration, insert the variables, and run terraform init:

```
module "datadog-metric-stream" {
  source  = "topotal/datadog-metric-stream/aws"
  version = "0.1.0"

  datadog_api_key           = "YOUR_DATADOG_API_KEY"
  s3_bucket_firehose_backup	= "EXAMPLE_S3_BUCKET_NAME_FOR_FIREHOSE_BACKUP"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.datadog-metric-stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.datadog-metric-stream-http_endpoint_delivery](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_cloudwatch_log_stream.datadog-metric-stream-s3_backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_cloudwatch_metric_stream.datadog](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_stream) | resource |
| [aws_iam_role.datadog-firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.datadog-metric-stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.datadog-firehose-s3-backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.datadog-metric-stream-firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kinesis_firehose_delivery_stream.datadog](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_s3_bucket.datadog-firehose-backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.datadog-firehose-assume-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.datadog-firehose-s3-backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.datadog-metric-stream-assume-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.datadog-metric-stream-firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_iam_role_datadog_firehose_name"></a> [aws\_iam\_role\_datadog\_firehose\_name](#input\_aws\_iam\_role\_datadog\_firehose\_name) | The name of the IAM Role for Kinesis Firehose | `string` | `"DatadogFirehoseRole"` | no |
| <a name="input_aws_iam_role_datadog_metric_stream_name"></a> [aws\_iam\_role\_datadog\_metric\_stream\_name](#input\_aws\_iam\_role\_datadog\_metric\_stream\_name) | The name of the IAM Role for Datadog Metric Stream | `string` | `"DatadogMetricStreamRole"` | no |
| <a name="input_aws_iam_role_policy_datadog_firehose_s3_backup_name"></a> [aws\_iam\_role\_policy\_datadog\_firehose\_s3\_backup\_name](#input\_aws\_iam\_role\_policy\_datadog\_firehose\_s3\_backup\_name) | The name of the IAM Role Policy for Firehose to allow PutObject to Firehose | `string` | `"DatadogFirehoseS3BackupPolicy"` | no |
| <a name="input_aws_iam_role_policy_datadog_metric_stream_firehose_name"></a> [aws\_iam\_role\_policy\_datadog\_metric\_stream\_firehose\_name](#input\_aws\_iam\_role\_policy\_datadog\_metric\_stream\_firehose\_name) | The name of the IAM Role Policy for Metric Stream to allow PutRecords to Firehose | `string` | `"DatadogMetricStreamFirehosePolicy"` | no |
| <a name="input_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#input\_cloudwatch\_log\_group\_name) | The name of the CloudWatch log group | `string` | `"datadog-metric-stream"` | no |
| <a name="input_cloudwatch_metric_stream_name"></a> [cloudwatch\_metric\_stream\_name](#input\_cloudwatch\_metric\_stream\_name) | The name of the CloudWatch Metric Stream | `string` | `"datadog"` | no |
| <a name="input_cloudwatch_metric_stream_output_format"></a> [cloudwatch\_metric\_stream\_output\_format](#input\_cloudwatch\_metric\_stream\_output\_format) | The output fotmat of the CloudWatch Metric Stream | `string` | `"opentelemetry0.7"` | no |
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | The API Key for Datadog | `string` | n/a | yes |
| <a name="input_datadog_firehose_endpoint"></a> [datadog\_firehose\_endpoint](#input\_datadog\_firehose\_endpoint) | Datadog Kinesis Firehose Endpoint | `string` | `"https://awsmetrics-intake.datadoghq.com/v1/input"` | no |
| <a name="input_kinesis_firehose_delivery_stream_name"></a> [kinesis\_firehose\_delivery\_stream\_name](#input\_kinesis\_firehose\_delivery\_stream\_name) | The name of Kinesis Firehose | `string` | `"datadog"` | no |
| <a name="input_s3_bucket_backup_prefix"></a> [s3\_bucket\_backup\_prefix](#input\_s3\_bucket\_backup\_prefix) | The prefix of the S3 bucket for backup | `string` | `"metrics/"` | no |
| <a name="input_s3_bucket_firehose_backup"></a> [s3\_bucket\_firehose\_backup](#input\_s3\_bucket\_firehose\_backup) | The name of the S3 bucket for backup | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
