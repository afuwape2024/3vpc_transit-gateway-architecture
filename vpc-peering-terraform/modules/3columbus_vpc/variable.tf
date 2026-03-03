variable "columbus_vpc" {
  type = string
}

variable "columbus_vpc_cidr_block" {
  type = string
}

variable "columbus_web_subnet_cidr_block" {
  type = list(string)
}

variable "columbus_app_subnet_cidr_block" {
  type = list(string)
}

variable "columbus_db_subnet_cidr_block" {
  type = list(string)
}

variable "availability_zones" {
	type = list(string)
}
