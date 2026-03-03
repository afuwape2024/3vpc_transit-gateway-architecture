variable "chicago_vpc" {
	type = string
}

variable "chicago_vpc_cidr_block" {
	type = string
}

variable "chicago_web_subnet_cidr_block" {
	type = list(string)
}

variable "chicago_app_subnet_cidr_block" {
	type = list(string)
}

variable "chicago_db_subnet_cidr_block" {
	type = list(string)
}

variable "availability_zones" {
	type = list(string)
}
