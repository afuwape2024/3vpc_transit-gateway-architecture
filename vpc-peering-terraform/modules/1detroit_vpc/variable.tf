variable "detroit_vpc" {
	type = string
}

variable "detroit_vpc_cidr_block" {
	type = string
}

variable "detroit_web_subnet_cidr_block" {
	type = list(string)
}

variable "detroit_app_subnet_cidr_block" {
	type = list(string)
}

variable "detroit_db_subnet_cidr_block" {
	type = list(string)
}

variable "availability_zones" {
	type = list(string)
}
