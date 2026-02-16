lambda_zip_path = "../a.zip"

# Optional overrides
function_name   = "MirroringTWDrugDataToS3"
aws_region      = "ap-east-2"
runtime         = "nodejs24.x"
timeout_seconds = 600
memory_size     = 128
# log_retention_days = 14

# tags = {
#   Project = "twdi-drug-backend"
# }

# EventBridge schedule
#enable_schedule    = true
#schedule_expression = "rate(1 day)"
