# ============================================================================
# IPv6 Dual-Stack VPC Infrastructure
# ============================================================================

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
  azs          = var.azs
  
  enable_ipv6              = true
  enable_nat_gateway       = true
  enable_egress_only_igw   = true
  single_nat_gateway       = var.environment == "dev" ? true : false
}

# Security Module
module "security" {
  source = "./modules/security"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = module.vpc.vpc_cidr_block
  vpc_ipv6_cidr = module.vpc.vpc_ipv6_cidr_block
}

# Monitoring Module
module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
  alert_email  = var.alert_email
}

# Example EC2 instances in dual-stack subnets
module "compute" {
  source = "./modules/compute"

  project_name         = var.project_name
  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  private_subnet_ids   = module.vpc.private_subnet_ids
  security_group_id    = module.security.instance_security_group_id
  instance_type        = var.instance_type
  enable_ipv6          = true
}
