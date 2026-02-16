# Lambda Terraform

Terraform configuration for the AWS Lambda function `MirroringTWDrugDataToS3` in `ap-northeast-1`.

## Prerequisites

- Terraform >= 1.5
- AWS credentials configured for your target account
- Deployment package generated at repo root (`a.zip`)

Build package from repo root:

```bash
npm run build
npm run pack
```

## Deploy

From `terraform`:

```bash
terraform init
terraform plan
terraform apply
```

## Notes

- This creates Lambda + IAM role/policies + CloudWatch log group.
- If the Lambda already exists in AWS, import it before apply:

```bash
terraform import aws_lambda_function.this MirroringTWDrugDataToS3
```

You may also need to import IAM/log resources if they already exist.
