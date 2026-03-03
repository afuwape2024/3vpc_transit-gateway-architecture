module "detriot_vpc" {
  source = "../../modules/1detroit_vpc"
  detroit_vpc                    = var.detroit_vpc
  detroit_vpc_cidr_block         = var.detroit_vpc_cidr_block
  detroit_web_subnet_cidr_block  = var.detroit_web_subnet_cidr_block
  detroit_app_subnet_cidr_block  = var.detroit_app_subnet_cidr_block
  detroit_db_subnet_cidr_block   = var.detroit_db_subnet_cidr_block
  availability_zones             = var.availability_zones
}

module "chicago_vpc" {
  source = "../../modules/2chicago_vpc"

  chicago_vpc                   = var.chicago_vpc
  chicago_vpc_cidr_block        = var.chicago_vpc_cidr_block
  chicago_web_subnet_cidr_block = var.chicago_web_subnet_cidr_block
  chicago_app_subnet_cidr_block = var.chicago_app_subnet_cidr_block
  chicago_db_subnet_cidr_block  = var.chicago_db_subnet_cidr_block
  availability_zones            = var.availability_zones
}


module "columbus_vpc" {
  source = "../../modules/3columbus_vpc"

  columbus_vpc                   = var.columbus_vpc
  columbus_vpc_cidr_block        = var.columbus_vpc_cidr_block
  columbus_web_subnet_cidr_block = var.columbus_web_subnet_cidr_block
  columbus_app_subnet_cidr_block = var.columbus_app_subnet_cidr_block
  columbus_db_subnet_cidr_block  = var.columbus_db_subnet_cidr_block
  availability_zones             = var.availability_zones
}

module "internet_gateway" {
  source = "../../modules/internet_gateway"
  chicago_vpc = module.chicago_vpc.chicago_vpc
  detroit_vpc = module.detriot_vpc.detroit_vpc
  columbus_vpc = module.columbus_vpc.columbus_vpc
}


module "route_table" {
  source = "../../modules/route_table"
  detroit_vpc = module.detriot_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detriot_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet = module.detriot_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detriot_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detriot_vpc.detroit_vpc_private2_subnet    
}
