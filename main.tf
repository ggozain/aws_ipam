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
