output "aws_s3_bucket" {
  value = aws_s3_bucket.this.bucket
}

output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "aws_iam_role_GH_S3" {
  value = aws_iam_role.GithubAcS3.arn
}