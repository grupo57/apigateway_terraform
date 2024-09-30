resource "aws_lambda_function" "java_authentication_lambda_function" {
  runtime          = "${var.lambda_runtime}"
  filename         = "${var.lambda_authentication_payload_filename}"
  source_code_hash = "${base64sha256(filebase64(var.lambda_authentication_payload_filename))}"
  function_name    = "lambda_authentication"

  handler     = "${var.lambda_authentication_function_handler}"
  timeout     = 60
  memory_size = 256
  role        = "${aws_iam_role.iam_role_for_lambda.arn}"
  depends_on = [aws_cloudwatch_log_group.log_group]

  environment {
    variables = {
      db_user = var.rdsuser
      db_pwd  = var.rdspasswd
      db_url  = var.rdsurl
    }
  }

}

resource "aws_lambda_permission" "java_authentication_lambda_function" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.java_authentication_lambda_function.function_name}"
  principal     = "apigateway.amazonaws.com"
  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn    = "${aws_api_gateway_deployment.java_lambda_deploy.execution_arn}/*/*"
}