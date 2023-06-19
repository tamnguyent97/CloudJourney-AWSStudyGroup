resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name              = aws_s3_bucket.this.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
    origin_id                = aws_s3_bucket.this.bucket
  }

  enabled = true
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.this.bucket
    viewer_protocol_policy = "allow-all"
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }
  default_root_object = "index.html"
}

resource "aws_cloudfront_origin_access_control" "this" {
  name                              = aws_s3_bucket.this.bucket
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}