
data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_name
}

locals {
  environment                             = terraform.workspace
  k8s_info                                = lookup(var.environments, local.environment)
  cluster_name                            = lookup(local.k8s_info, "cluster_name")
  region                                  = lookup(local.k8s_info, "region")
  env                                     = lookup(local.k8s_info, "env")
  vpc_id                                  = module.vpc.vpc_id
  vpc_cidr                                = lookup(local.k8s_info, "vpc_cidr")
  private_subnet_ids                      = module.vpc.private_subnets
  cluster_version                         = lookup(local.k8s_info, "cluster_version")
  cluster_enabled_log_types               = lookup(local.k8s_info, "cluster_enabled_log_types")
  eks_managed_node_groups                 = lookup(local.k8s_info, "eks_managed_node_groups")
  cluster_security_group_additional_rules = lookup(local.k8s_info, "cluster_security_group_additional_rules")
  

  prefix             = "${local.project}-${local.environment}-${var.region}"
  eks_access_entries = flatten([for k, v in local.k8s_info.eks_access_entries : [for s in v.user_arn : { username = s, access_policy = lookup(local.eks_access_policy, k), group = k }]])

  eks_access_policy = {
    viewer = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy",
    admin  = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  }
  project    = "test"
  default_tags = {
    environment = local.environment
    managed_by  = "terraform"
    project     = local.project
  }
}
