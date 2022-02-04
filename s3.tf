resource "aws_s3_bucket" "datadog-firehose-backup" {
  bucket = var.s3_bucket_firehose_backup
}
