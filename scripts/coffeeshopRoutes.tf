#base coffee shop resource
resource "aws_api_gateway_resource" "coffeeshop_resource" {
  rest_api_id = "${aws_api_gateway_rest_api.example.id}"
  parent_id   = "${aws_api_gateway_rest_api.example.root_resource_id}"
  path_part   = "coffeeshop"
}

#get 
resource "aws_api_gateway_method" "coffeeshop_get" {
  rest_api_id   = "${aws_api_gateway_rest_api.example.id}"
  http_method   = "GET"
  resource_id   = "${aws_api_gateway_resource.coffeeshop_resource.id}"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "coffeeshop_get_integration" {
  rest_api_id = "${aws_api_gateway_rest_api.example.id}"
  resource_id = "${aws_api_gateway_resource.coffeeshop_resource.id}"
  http_method = "GET"
  type        = "AWS_PROXY"

  uri = "${aws_lambda_function.coffeeshopGet.invoke_arn}"

  integration_http_method = "POST"
  credentials             = "${aws_iam_role.invocation_role.arn}"

  depends_on = ["aws_api_gateway_method.coffeeshop_get"]
}



