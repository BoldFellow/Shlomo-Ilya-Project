locals {
  # Define the number of private and public subnets
  private_subnet_count = 2
  public_subnet_count  = 2

  # Generate private subnet CIDRs - start from 1, jump by 2
  private_subnets = [
    for i in range(local.private_subnet_count) : 
      cidrsubnet(module.vpc["vpc-one"].vpc_cidr_block, 8, 1 + (i * 2))
  ]
  
  # Generate public subnet CIDRs - start from 2, jump by 2
  public_subnets = [
    for i in range(local.public_subnet_count) : 
      cidrsubnet(module.vpc["vpc-one"].vpc_cidr_block, 8, 2 + (i * 2))
  ]
}

################################################

# VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  for_each = var.vpcs

  name            = each.key
  cidr            = each.value.cidr
  azs             = each.value.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  map_public_ip_on_launch = true

  enable_nat_gateway = false
  enable_vpn_gateway = false
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = each.value.tags
}
