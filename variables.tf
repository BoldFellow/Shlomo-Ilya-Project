variable "vpcs" {
  type = map(object({
    cidr            = string
    azs             = list(string)
    # private_subnets = list(string)
    # public_subnets  = list(string)
    tags            = map(string)
  }))
  description = "List of VPCs + Subnets to be created"
}