module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "eks-vpc"
  cidr   = local.vpc_cidr

  enable_dns_hostnames = true
  #enable_dns_support   = true

  azs               = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets    = ["10.0.0.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  map_public_ip_on_launch = true
}