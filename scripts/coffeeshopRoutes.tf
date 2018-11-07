#base coffee shop resource
resource "aws_api_gateway_resource" "coffeeshop_resource" {
  rest_api_id = "${aws_api_gateway_rest_api.example.id}"
  parent_id   = "${aws_api_gateway_rest_api.example.root_resource_id}"
  path_part   = "coffeeshop"
}



