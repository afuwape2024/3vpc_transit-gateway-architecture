variable "region" {
  description = "provision region in US-EAST-2"
}
variable "detroit_vpc" {
  type = string
  description = "detroit_vpc"
}
variable "detroit_vpc_cidr_block" {
  type = string
  description = "the CIDR block for the detroit VPC"
}

variable "detroit_web_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the web subnets"
}

variable "detroit_app_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the application subnets"
}
variable "detroit_db_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the database subnets"
}
# =======================================================

variable "chicago_vpc" {
  type = string
  description = "chicago_vpc"
}
variable "chicago_vpc_cidr_block" {
  type = string
  description = "the CIDR block for the chicago VPC"
}

variable "chicago_web_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the web subnets"
}

variable "chicago_app_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the application subnets"
}
variable "chicago_db_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the database subnets"
}
#=======================================================
variable "columbus_vpc" {
  type = string
  description = "columbus_vpc"
}
variable "columbus_vpc_cidr_block" {
  type = string
  description = "the CIDR block for the detroit VPC"
}

variable "columbus_web_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the web subnets"
}

variable "columbus_app_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the application subnets"
}
variable "columbus_db_subnet_cidr_block" {
  type = list(string)
  description = "the list of CIDR blocks for the database subnets"
}

###############################################################
variable "availability_zones" {
  type = list(string)
  description = "the list of availability zones to use for the subnets"
}

variable "image_id" {
  type = string
  description = "the image was selected from us-east-2 region"
}

variable "instance_type" {
  type = string 
}

variable "outside_cidr_block" {
  type = string
  description = "traffic coming from outside"
}


