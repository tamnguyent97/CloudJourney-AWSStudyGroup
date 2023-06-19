#!/bin/bash

# Running in local
# set -x
source env.sh

aws_s3_bucket=`terraform output -raw aws_s3_bucket`
curl -o S3-Website-main.zip -L https://github.com/AWS-First-Cloud-Journey/S3-Website/archive/refs/heads/main.zip 
unzip S3-Website-main.zip
aws s3 cp S3-Website-main s3://$aws_s3_bucket --recursive --profile=$profile --quiet
rm -rf S3-Website-main.zip S3-Website-main