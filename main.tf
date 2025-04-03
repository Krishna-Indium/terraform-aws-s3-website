# Create S3 Bucket Resource
terraform {
  backend "http" {
    address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/harnesspoc/workspaces/terraformkaja/terraform-backend?accountIdentifier=Zttn2VPHRki_xzEuBgsSbg"
    username = "harness"
    lock_address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/harnesspoc/workspaces/terraformkaja/terraform-backend/lock?accountIdentifier=Zttn2VPHRki_xzEuBgsSbg"
    lock_method = "POST"
    unlock_address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/harnesspoc/workspaces/terraformkaja/terraform-backend/lock?accountIdentifier=Zttn2VPHRki_xzEuBgsSbg"
    unlock_method = "DELETE"
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.bucket_name}/*"
          ]
      }
  ]
}  
EOF

  tags          = var.tags
  force_destroy = true
}

