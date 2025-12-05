variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC IPv4 CIDR block"
  type        = string
}

variable "vpc_ipv6_cidr" {
  description = "VPC IPv6 CIDR block"
  type        = string
  default     = null
}
