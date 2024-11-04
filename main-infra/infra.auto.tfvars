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

sgs = {
  vpc-one = {
    vpc_key     = "vpc-one"  # This will be used to lookup the VPC ID
    description = "vpc-one"
  
  tags = {
      name = "vpc-one"
    }
   ingress_cidr_blocks = ["10.100.0.0/16"] # Use the CIDR of vpc-third
    ingress_with_cidr_blocks = {
        all_traffic_my_home = {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          description = "all"
          cidr_blocks = "10.100.0.0/16"
        },
        all_traffic_vpc = {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          description = "all"
          cidr_blocks = "84.228.161.67/32"
        }
  }  
  }
}
