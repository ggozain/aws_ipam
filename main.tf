locals {
  # ensure current provider region is an operating_regions entry
  all_ipam_regions = distinct(concat([var.aws_region], var.ipam_regions))

}

resource "aws_vpc_ipam" "main" {
  description = "Multi region ipam"
  dynamic "operating_regions" {
    for_each = local.all_ipam_regions
    content {
      region_name = operating_regions.value
    }
  }
}

resource "aws_vpc_ipam_pool" "parent" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.main.private_default_scope_id
}

resource "aws_vpc_ipam_pool_cidr" "parent" {
  ipam_pool_id = aws_vpc_ipam_pool.parent.id
  cidr         = var.parent_pool_cidr
}

resource "aws_vpc_ipam_pool" "child" {
  # for_each            = var.child_pool_cidr_region_map
  address_family      = "ipv4"
  ipam_scope_id       = aws_vpc_ipam.main.private_default_scope_id
  locale              = var.aws_region
  source_ipam_pool_id = aws_vpc_ipam_pool.parent.id
}


resource "aws_vpc_ipam_pool_cidr" "child" {
  # count        = length(var.child_pool_cidr_region_map)
  ipam_pool_id = aws_vpc_ipam_pool.child.id
  cidr         = var.child_pool_cidr
}
