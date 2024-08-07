module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.19.1"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id = module.vpc.vpc_id
  subnet_ids=module.vpc.private_subnets
  cluster_endpoint_public_access  = true

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type="AL2_x86_64"
  }
  eks_managed_node_groups = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      one={
        name="master-node-group"
        instance_types=["t2.micro"]
        min_size     = 1
        max_size     = 3
        desired_size = 2
    }
    two={
        name="worker-node-group"
        instance_types=["t2.micro"]
        min_size     = 1
        max_size     = 3
        desired_size = 2
    }
 }
}
