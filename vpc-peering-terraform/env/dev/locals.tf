
locals {
  region             = var.region
  outside_cidr_block = var.outside_cidr_block
  availability_zones = var.availability_zones

  image_id      = var.image_id
  instance_type = var.instance_type
  database_rt_name = "database-rt"
  }

