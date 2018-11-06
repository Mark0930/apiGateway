resource "aws_dynamodb_table" "example" {
  name           = "CoffeeShops"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "name"

  attribute {
    name = "name"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "basic" {
  table_name = "${aws_dynamodb_table.example.name}"
  hash_key = "${aws_dynamodb_table.example.hash_key}"
  item = <<ITEM
{
  "name": {"S": "Pollen"},
  "address": {"S": "new islington"},
  "rating": {"N": "9"}
}
ITEM
}