variable "aws_region" {
  type        = string
  description = "The AWS Region where to create VPC"
}

variable "ipam_regions" {
  type        = list(any)
  default     = []
  description = "The IPAM regions (can be single or multi region IPAM)"
}

variable "tf_cloud_organization" {
  type        = string
  description = "The organisation of Terraform Cloud where remote state is stored"
}

variable "tf_cloud_workspace" {
  type        = string
  description = "The workspace of Terraform Cloud where remote state is stored"
}

variable "parent_pool_cidr" {
  type        = string
  description = "Parent pool CIDR to be created"
}

variable "child_pool_cidr" {
  type = string
  description = "Child pool cidr block)"

}