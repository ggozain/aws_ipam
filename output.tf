output "ipam_id" {
  description = "The IPAM ID"
  value       = aws_vpc_ipam.main.id
}

output "public_scope_id" {
  description = "The IPAM public scope ID"
  value       = aws_vpc_ipam.main.public_default_scope_id
}

output "private_scope_id" {
  description = "The IPAM private scope ID"
  value       = aws_vpc_ipam.main.private_default_scope_id
}

output "ipam_parent_pool_id" {
  description = "The IPAM parent pool id"
  value       = aws_vpc_ipam_pool_cidr.parent.id
}

# output "ipam_child_pool_id" {
#   description = "The IPAM child pool ids"
#   value       = { for id, cidr in aws_vpc_ipam_pool_cidr.child :
#   id => cidr
# }
# }