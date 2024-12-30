environments = {
  default = {
    # Global variables
    cluster_name                   = "my-eks-cluster"
    env                            = "default"
    region                         = "us-east-1"
    vpc_cidr                       = "10.0.0.0/16"
    cluster_version                = "1.30"
    cluster_endpoint_public_access = true
    cluster_endpoint_private_access = true

    # EKS variables
    eks_managed_node_groups = {
      testworkload = {
        min_size       = 1
        max_size       = 1
        desired_size   = 1
        instance_types = ["t3.medium"]
        capacity_type  = "ON_DEMAND"
        disk_size      = 60
        ebs_optimized  = true
        iam_role_additional_policies = {
          ssm_access        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
          cloudwatch_access = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
          service_role_ssm  = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
          default_policy    = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
        }
      }
    }
    cluster_security_group_additional_rules = {}

    # EKS Cluster Logging
    cluster_enabled_log_types = ["audit"]
    eks_access_entries = {
      viewer = {
        user_arn = []
      }
      admin = {
        user_arn = ["arn:aws:iam::0000000000:root"]
      }
    }

  }

}
