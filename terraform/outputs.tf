output "lambda_function_name" {
  description = "Created Lambda function name"
  value       = aws_lambda_function.this.function_name
}

output "lambda_function_arn" {
  description = "Created Lambda function ARN"
  value       = aws_lambda_function.this.arn
}

output "lambda_execution_role_arn" {
  description = "Execution role ARN used by the Lambda"
  value       = aws_iam_role.lambda_exec.arn
}
