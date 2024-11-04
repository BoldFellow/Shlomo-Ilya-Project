# module "security-group" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "5.2.0"

#   for_each = var.sgs

#   name        = each.value.name
#   description = each.value.description
#   vpc_id      = module.vpc.vpc_id

# }