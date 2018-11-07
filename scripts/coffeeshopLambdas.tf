# coffeeshop get
resource "aws_lambda_function" "coffeeshopGet" {
  function_name = "${var.environment}-coffeeshopGet"

  filename         = "../zips/coffeeshopGet.zip"
  source_code_hash = "${base64sha256(file("../zips/coffeeshopGet.zip"))}"

  handler = "index.handler"

  runtime = "nodejs8.10"

  environment {
    variables = {
      environment = "${var.environment}"
    }
  }

  role = "${aws_iam_role.lambda_exec.arn}"
}

resource "aws_lambda_permission" "coffeeshopGetPermission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.coffeeshopGet.arn}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_deployment.example.execution_arn}/*/*"
}