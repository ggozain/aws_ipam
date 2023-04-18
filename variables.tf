variable "aws_region" {
  type        = string
  description = "The AWS Region where to create VPC"
}

variable "ipam_regions" {
  type    = list(any)
  default = []
}

variable "tf_cloud_organization" {
  type        = string
  description = "The organisation of Terraform Cloud where remote state is stored"
}

variable "tf_cloud_workspace" {
  type        = string
  description = "The workspace of Terraform Cloud where remote state is stored"
}