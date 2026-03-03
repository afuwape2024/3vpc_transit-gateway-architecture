output "chicago_vpc" {
  value = aws_vpc.chicago_vpc.id
}
output "chicago_vpc_web_subnet_0" {
  value = aws_subnet.chicago_vpc_web_subnet_0.id
}
output "chicago_vpc_web_subnet_1" {
  value = aws_subnet.chicago_vpc_web_subnet_1.id
}
output "chicago_vpc_app_subnet_0" {
  value = aws_subnet.chicago_vpc_app_subnet_0.id
}
output "chicago_vpc_app_subnet_1" {
  value = aws_subnet.chicago_vpc_app_subnet_1.id
}
output "chicago_vpc_db_subnet_0" {
  value = aws_subnet.chicago_vpc_db_subnet_0.id
}
output "chicago_vpc_db_subnet_1" {
  value = aws_subnet.chicago_vpc_db_subnet_1.id
}