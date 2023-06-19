output "aws_s3_bucket" {
  value = aws_s3_bucket.this.bucket
}

output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}