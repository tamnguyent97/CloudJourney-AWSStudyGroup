# STARTING WITH AMAZON S3
https://000057.awsstudygroup.com/

This repo writes by terraform, can run on local or GitHub Actions
## Run on local ##
Prepare `env.sh`, `terraform.tfvars` files to store local environment

Use s3.sh file

## Run on Github Actions ##
Prepare `terraform.tfvars` file in `.github/workflows` to store local environment. Run manual on GitHub Actions with two Actions:
 - 000057-tf.yml
 - 000057-upload.yml 