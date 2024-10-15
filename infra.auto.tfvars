vpcs = {
  vpc-one = {
    cidr            = "10.100.0.0/16"
    azs             = ["us-east-1a", "us-east-1b"]
    # private_subnets = ["10.100.1.0/24", "10.100.3.0/24"]
    # public_subnets  = ["10.100.2.0/24", "10.100.4.0/24"]
    tags = {
      Automation = "Terraform"
    }
  }
}

#     vpc-two = {
#         cidr = "10.200.0.0/16"
#         azs = ["us-east-1a","us-east-1b"]
#         private_subnets = ["10.200.1.0/24", "10.200.3.0/24"]
#         public_subnets = ["10.200.2.0/24", "10.200.4.0/24"]
#         tags = {
#             name = "VPC-Two"
#         }
#     }
# }