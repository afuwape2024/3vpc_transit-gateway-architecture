output "detroit_vpc" {
  value = aws_vpc.detroit_vpc.id
}
output "detroit_vpc_web_subnet_0" {
  value = aws_subnet.detroit_vpc_web_subnet_0.id
}
output "detroit_vpc_web_subnet_1" {
  value = aws_subnet.detroit_vpc_web_subnet_1.id
}
output "detroit_vpc_app_subnet_0" {
  value = aws_subnet.detroit_vpc_app_subnet_0.id
}
output "detroit_vpc_app_subnet_1" {
  value = aws_subnet.detroit_vpc_app_subnet_1.id
}
output "detroit_vpc_db_subnet_0" {
  value = aws_subnet.detroit_vpc_db_subnet_0.id
}
output "detroit_vpc_db_subnet_1" {
  value = aws_subnet.detroit_vpc_db_subnet_1.id
}