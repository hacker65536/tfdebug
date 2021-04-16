data "aws_availability_zones" "azs" {
  state = "available"
}

/*
output "azs" {
  value = data.aws_availability_zones.azs
}
*/
